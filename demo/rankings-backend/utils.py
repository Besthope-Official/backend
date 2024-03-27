from flask import jsonify


class Result(object):
    @staticmethod
    def success(data=None):
        return jsonify({'status': 'sucess', 'data': data}), 200

    @staticmethod
    def error(code: int,
              message: str = "error"):
        return jsonify({'code': code, 'status': 'error', 'message': message}), code
