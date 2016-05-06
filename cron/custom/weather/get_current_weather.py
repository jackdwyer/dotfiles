# import os
import redis
import requests
import ConfigParser
import os

path = os.path.dirname(os.path.realpath(__file__))
config = ConfigParser.ConfigParser()

config.read(os.path.join(path, 'weather.conf'))
openweathermap_app_id = config.get('openweathermap', 'app_id')

r = requests.get("http://api.openweathermap.org/data/2.5/weather?id=5128581&appid={}".format(openweathermap_app_id))
cur_temp = round(float((r.json()['main']['temp']) - 273.15), 2)

red = redis.StrictRedis(host='localhost', port=6379, db=15)
red.set('cur_temp', cur_temp)
