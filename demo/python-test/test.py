import requests
import unittest
import os
from dotenv import load_dotenv
load_dotenv()


def mock_login_with_session():
    s = requests.Session()
    s.headers.update({
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
    })
    url = 'https://acm.hdu.edu.cn/userloginex.php'
    login_data = {
        'username': os.getenv('HDU_ACCOUNT'),
        'userpass': os.getenv('HDU_PASSWORD'),
        'login': 'Sign In'
    }
    login_para = {
        'action': 'login',
        'cid': 0,
        'notice': 0
    }
    response = s.post(url, data=login_data, params=login_para)
    return response


def mock_login_with_post():
    url = 'https://acm.hdu.edu.cn/userloginex.php'
    login_data = {
        'username': os.getenv('HDU_ACCOUNT'),
        'userpass': os.getenv('HDU_PASSWORD'),
        'login': 'Sign In'
    }
    login_para = {
        'action': 'login',
        'cid': 0,
        'notice': 0
    }
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
    }
    response = requests.post(url, data=login_data, params=login_para, headers=headers)
    return response


class TestMockLogin(unittest.TestCase):

    def test_login_with_session(self):
        response = mock_login_with_session()
        self.assertEqual(response.status_code, 302)

    def test_login_with_post(self):
        response = mock_login_with_post()
        self.assertEqual(response.status_code, 302)


if __name__ == '__main__':
    unittest.main()
