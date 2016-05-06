import twitter
import ConfigParser
import time
import os

path = os.path.dirname(os.path.realpath(__file__))

config = ConfigParser.ConfigParser()
config.read(os.path.join(path, 'heartbeat.conf'))


def heart_beat():
    tweet = 'Heart is beating #_{0}'.format(str(int(time.time())))
    api = twitter.Api(consumer_key=config.get('twitter', 'consumer_key'),
                      consumer_secret=config.get('twitter', 'consumer_secret'),
                      access_token_key=config.get('twitter', 'access_token_key'),
                      access_token_secret=config.get('twitter', 'access_token_secret'))
    status = api.PostUpdate(tweet)
    # print(status)

if __name__ == '__main__':
    heart_beat()
