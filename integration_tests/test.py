import asyncio
import json
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import websockets
import os
from selenium import webdriver
from selenium.webdriver.support.ui import Select
from selenium.webdriver.common.keys import Keys

TOKEN_ALICE = (
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.'
    'eyJ1c2VyIjoiYWJvbmlsbGErYm90MUBldmVudGJyaXRlLmNvbSJ9.'
    'bQ2uIy4ShAmqNaJ_0BkDyjp8SO1Y2ufr61P7GKKtoXE'
)
USER_ALICE = 'abonilla+bot1@eventbrite.com'
TOKEN_BOB = (
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.'
    'eyJ1c2VyIjoiYWJvbmlsbGErYm90MkBldmVudGJyaXRlLmNvbSJ9.'
    'iTBLRfv8bJGovvSj1rZi_Gl2BvTlLwGTBSutksQXU5o'
)
USER_BOB = 'abonilla+bot2@eventbrite.com'
BOT_PASSWORD = os.environ.get('TEST_BOT_PASSWORD')

SERVER_HOST = os.environ.get('SERVER_HOST', 'localhost')
SERVER_PORT = os.environ.get('SERVER_PORT', '5000')
WEB_HOST = os.environ.get('WEB_HOST', 'localhost')
WEB_PORT = os.environ.get('WEB_PORT', '8000')

BASE_URL = f'http://{WEB_HOST}:{WEB_PORT}'
SERVER_URL = f'ws://{SERVER_HOST}:{SERVER_PORT}/ws/?token={{}}'


class GameOver(Exception):
    pass


class Action:
    def __init__(self, data) -> None:
        self.action = None
        self.game_id = data['game_id']
        self.turn_token = data['turn_token']

    def to_dict(self):
        return {
            'action': self.action,
            'data': {
                'game_id': self.game_id,
                'turn_token': self.turn_token,
            },
        }


class Move(Action):
    def __init__(self, data, from_row, to_row, from_col, to_col) -> None:
        super().__init__(data)
        self.action = 'move'
        self.from_row = from_row
        self.to_row = to_row
        self.from_col = from_col
        self.to_col = to_col

    def to_dict(self):
        ret = super().to_dict()
        ret['data'].update({
            'from_row': self.from_row,
            'to_row': self.to_row,
            'from_col': self.from_col,
            'to_col': self.to_col,
        })
        return ret


class Wall(Action):
    def __init__(self, data, row, col, orientation) -> None:
        super().__init__(data)
        self.action = 'wall'
        self.row = row
        self.col = col
        self.orientation = orientation

    def to_dict(self):
        ret = super().to_dict()
        ret['data'].update({
            'row': self.row,
            'col': self.col,
            'orientation': self.orientation,
        })
        return ret


async def bot_task(ws):
    while True:
        msg = json.loads(await ws.recv())
        print(f'Recv: {msg}')
        try:
            resp = COMMAND[msg['event']](msg)
        except GameOver:
            break
        if resp:
            await ws.send(json.dumps(resp))
            print(f'Sent: {resp}')


def bot_turn_gen():
    for action, params in BOT_MOVES.items():
        yield (action, params)
    while True:
        yield(Move, [0, 0, 0, 0])


def bot_turn(msg):
    data = msg['data']
    action, params = next(BOT_MOVE_GENERATOR)
    return action(data, *params).to_dict()


async def test():
    # Connect Websocket clients
    ws_alice = await websockets.connect(SERVER_URL.format(TOKEN_ALICE))
    ws_bob = await websockets.connect(SERVER_URL.format(TOKEN_BOB))
    bot_task_1 = asyncio.create_task(bot_task(ws_alice))
    bot_task_2 = asyncio.create_task(bot_task(ws_bob))

    # Setup Selenium driver
    chrome_options = webdriver.ChromeOptions()
    chrome_options.headless = True
    web = webdriver.Remote(
        command_executor='http://localhost:4444/wd/hub',
        desired_capabilities=DesiredCapabilities.CHROME,
        options=chrome_options,
    )

    # Login
    web.get(f'{BASE_URL}/oauth/login/linkedin-oauth2/')
    user_input = web.find_element_by_id('username')
    user_input.send_keys(USER_ALICE)
    pwd_input = web.find_element_by_id('password')
    pwd_input.send_keys(BOT_PASSWORD)
    pwd_input.send_keys(Keys.RETURN)
    assert web.current_url == f'{BASE_URL}/'
    assert 'AliceBot1' in web.page_source

    # Send challenge (web, bot1)
    web.get(f'{BASE_URL}/challenge')
    bot1_input = Select(web.find_element_by_id('id_bot1'))
    bot1_input.select_by_visible_text(USER_ALICE)
    bot2_input = Select(web.find_element_by_id('id_bot2'))
    bot2_input.select_by_visible_text(USER_BOB)
    create_challenge_btn = web.find_element_by_xpath("//input[@type='submit']")
    create_challenge_btn.click()
    assert 'Challenge sent: abonilla+bot1@eventbrite.com VS abonilla+bot2@eventbrite.com' in web.page_source

    # Accept challenge (bot2)
    # Play (bot1,bot2)
    # [in bot_task]
    await asyncio.wait([bot_task_1, bot_task_2])


#########################
# Movements go here
BOT_MOVES = {
    Move: [0, 4, 1, 4],
    Wall: [0, 0, 'v'],
}
#########################


BOT_MOVE_GENERATOR = bot_turn_gen()

COMMAND = {
    'list_users': lambda _: None,
    'challenge': lambda msg: {
        'action': 'accept_challenge',
        'data': {'challenge_id': msg['data']['challenge_id']},
    },
    'your_turn': bot_turn,
    'game_over': lambda _: exec('raise GameOver()'),
    'error': lambda _: None,
}


if __name__ == '__main__':
    asyncio.run(test())
