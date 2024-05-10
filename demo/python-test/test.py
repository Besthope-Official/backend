from dotenv import load_dotenv
load_dotenv()
import os
import unittest
from requests import Session

def mock_login():
    s = Session()
    url = 'https://acm.hdu.edu.cn/userloginex.php'
    login_data = {
        'username': os.getenv('HDU_ACCOUNT'),
        'userpass': os.getenv('HDU_PASSWORD'),
        'login': 'Sign In'
    }
    login_para = {
        'action': 'login'
    }
    response = s.post(url, data=login_data, params=login_para)
    return response

class TestMockLogin(unittest.TestCase):
    
    def test_login(self):
        response = mock_login()
        self.assertEqual(response.status_code, 302)


if __name__ == '__main__':
    unittest.main()