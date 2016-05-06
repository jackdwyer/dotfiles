import sys
import json
import redis

green = '#00ff00'
red = '#FF0000'
yellow = '#FDFF00'
light_blue = '#33CCFF'

r = redis.StrictRedis(host='localhost', port=6379, db=15)

def get_current_reminder_task():
    task = r.get('cur_reminder')
    if task:
        return {"name": "current_reminder_task", "color": light_blue, "full_text": "R: " + str(task)}
    return False


def get_current_asana_task():
    task = r.get('cur_asana')
    if task:
        return {"name": "current_asana_task", "color": yellow, "full_text": "A: " + str(task)}
    return False

def get_status_checks():
    status = list()
    for k,v in r.hgetall('status_check').iteritems():
        color = green
        if 'YES' not in v:
            color = red
        status.append({"color": color, "name": "status_check", "full_text": "{1}".format(k, v)})
    return status


def get_current_weather():
    try:
        data = r.get('cur_temp')
        value = float(data)
        color = "#FFFFFF"
        if value >= 10.0:
            color = "#FFCC00"
        elif value < 10.0 and value > 0.0:
            color = "#00CCFF"
        else:
            color = "#00FFFF"
    except:
            return False
    return {"name": "current_temp", "color": color, "full_text": "NY: " + str(data)}


def read_line():
    try:
        line = sys.stdin.readline().strip()
        if not line:
            sys.exit(3)
        return line
    except KeyboardInterrupt:
        sys.exit()

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

red = "#FF0000"
green = "#00FF00"
yellow = "#FFFF00"


if __name__ == '__main__':
    print_line(read_line())
    print_line(read_line())
    while True:
        line = read_line()
        prefix = ""
        if line[0] == ",":
            line = line[1:]
            prefix = ","
        d = json.loads(line)
        current_weather = get_current_weather()
        if current_weather:
            d.insert(0, current_weather)

        for l in get_status_checks():
            d.insert(0, l)
        task = get_current_asana_task()
        if task:
            d.insert(0, task)
        task = get_current_reminder_task()
        if task:
            d.insert(0, task)

        print_line(prefix+json.dumps(d))
