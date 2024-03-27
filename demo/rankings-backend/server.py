# tetris game online
import asyncio
import websockets

import os
import datetime
from dotenv import load_dotenv
from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy

from utils import Result

# region: initialization & configuration

basedir = os.path.abspath(os.path.dirname(__name__))
load_dotenv('.env')

# initialize flask app and database
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get(
    'SQLALCHEMY_DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# models


class Player(db.Model):
    __tablename__ = 'players'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(50), nullable=False)
    rank = db.Column(db.Integer, nullable=False, default=999)
    score = db.Column(db.Integer, nullable=False, default=0)

    def to_json(self):
        return {
            'id': self.id,
            'name': self.name,
            'rank': self.rank,
            'score': self.score
        }


class Game(db.Model):
    __tablename__ = 'games'
    id = db.Column(db.Integer, primary_key=True)
    game_type = db.Column(db.String(50), nullable=False)
    score = db.Column(db.Integer, nullable=False, info='score of the game')
    timestamp = db.Column(db.DateTime, nullable=False,
                          default=datetime.datetime.now())
    is_finished = db.Column(db.Boolean, nullable=False, default=False)
    # relate to player column
    player_id = db.Column(db.Integer, db.ForeignKey(
        'players.id'), nullable=False)
    player = db.relationship('Player', backref=db.backref('games', lazy=True))

    def to_json(self):
        return {
            'id': self.id,
            'game_type': self.game_type,
            'player_id': self.player_id,
            'score': self.score,
            'timestamp': self.timestamp.strftime('%Y-%m-%d %H:%M:%S')
        }

    def __repr__(self):
        return f"Game(id={self.id}, game_type={self.game_type}, player_id={self.player_id}, score={self.score}, timestamp={self.timestamp})"


class Round(db.Model):
    __tablename__ = 'rounds'
    id = db.Column(db.Integer, primary_key=True)
    winner_id = db.Column(db.String(50), nullable=True)
    is_finished = db.Column(db.Boolean, nullable=True, default=False)
    # game 1
    game_id = db.Column(db.Integer, db.ForeignKey('games.id'), nullable=False)
    # game 2
    game_id2 = db.Column(db.Integer, db.ForeignKey('games.id'), nullable=False)

    def to_json(self):
        return {
            'id': self.id,
            'winner_id': self.winner_id,
            'game_id': self.game_id,
            'game_id2': self.game_id2
        }

# endregion

# views

# region: test views, will be removed in production


@app.route('/admin/player', methods=['POST'])
def create_player():
    name = request.form.get('name')
    new_player = Player(name=name)
    db.session.add(new_player)
    db.session.commit()

    return Result.success(new_player.to_json())


@app.route('/admin/player/<int:player_id>', methods=['GET'])
def get_player(player_id):
    player = Player.query.filter_by(id=player_id).first()
    if player is None:
        return Result.error(404, 'Player not found.')

    return Result.success(player.to_json())

# endregion


@app.route('/game', methods=['POST'])
def start_game():
    game_type = request.form.get('game_type')
    player_id = request.form.get('player_id')

    new_game = Game(game_type=game_type, player_id=player_id, score=0)
    db.session.add(new_game)
    db.session.commit()

    return Result.success(new_game.to_json())


@app.route('/game/<int:game_id>', methods=['PUT'])
def end_game(game_id):
    score = request.form.get('score', type=int)
    game = Game.query.filter_by(id=game_id).first_or_404()

    if game.is_finished:
        return Result.error(400, 'Game has already ended.')

    game.is_finished = True
    game.score = score
    db.session.commit()

    return Result.success(game.to_json())


@app.route('/round', methods=['POST'])
def start_round():
    game1_id = request.form.get('game1_id')
    game2_id = request.form.get('game2_id')

    game1 = Game.query.filter_by(id=game1_id).first_or_404()
    game2 = Game.query.filter_by(id=game2_id).first_or_404()

    if game1.is_finished or game2.is_finished:
        return Result.error(400, 'Game has already ended.')

    if game1.game_type != "multiplay" or game2.game_type != "multiplay":
        return Result.error(400, 'Game type is not multiplay.')

    new_round = Round(game_id=game1_id, game_id2=game2_id)
    db.session.add(new_round)
    db.session.commit()

    return Result.success(new_round.to_json())


@app.route('/round/<int:round_id>', methods=['PUT'])
def end_round(round_id):
    round = Round.query.filter_by(id=round_id).first_or_404()

    if round.is_finished:
        return Result.error(400, 'Round has already ended.')

    game1 = Game.query.filter_by(id=round.game_id).first_or_404()
    game2 = Game.query.filter_by(id=round.game_id2).first_or_404()

    if not game1.is_finished:
        return Result.error(400, f"{game1.player.name}'s game is not over.")
    if not game2.is_finished:
        return Result.error(400, f"{game2.player.name}'s game is not over.")

    if game1.score > game2.score:
        winner_id = game1.player_id
    else:
        winner_id = game2.player_id

    winner = Player.query.filter_by(id=winner_id).first()
    winner.score += 10

    round.winner_id = winner_id
    round.is_finished = True
    db.session.commit()

    return Result.success(round.to_json())


@app.route('/rank', methods=['GET'])
def get_rank():
    players = Player.query.order_by(Player.score.desc()).all()
    rank = 1
    for player in players:
        player.rank = rank
        rank += 1

    db.session.commit()

    return Result.success([player.to_json() for player in players])


if __name__ == '__main__':
    app.run(debug=True)
