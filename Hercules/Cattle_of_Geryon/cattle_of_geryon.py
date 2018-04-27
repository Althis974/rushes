# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    test.py                                          .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/04/11 11:02:58 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/04/11 12:30:57 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

import requests
import sys
import time
import color

# Set up parameters
url = 'https://www.joedog.org/'
max_hits = 5
clients = 3
req = {
        'trans': clients * max_hits,
        'success': 0,
        'fail': 0,
        'time': 0,
        'size': 0,
        'long': '0',
        'short': '0'
        }

# Check for valid url
try:
    r = requests.get(url)
    print(color.magenta('STARTING SERVER BENCHMARKING'))
    print(color.magenta('URL:\t\t', url))
    print(color.magenta('Clients:\t', clients))
    print(color.magenta('Requests:\t', max_hits, '\n'))
    time.sleep(1)

except:
    print(color.red('Bad url, stopping'))
    sys.exit(1)

print(color.yellow('** Cattle of Geryon 2.0'))
print(color.yellow('** Preparing 1 concurrent users for battle.'))
print(color.yellow('The server is now under siege...'))

# Start benchmark
i = 0
while i < clients:
    hits = 0
    while hits < max_hits:
        r = requests.get(url)

        # Status of request
        status = r.status_code
        if status == 200:
            req['success'] += 1
        else:
            req['fail'  ] += 1

        # Time of request
        time = str(r.elapsed)[5:-4]
        req['time'] += float(time)
        if i == 0 and hits == 0:
            req['short'] = time
        if req['long'] < time:
            req['long'] = time
        if req['short'] > time:
            req['short'] = time

        # Size of data transfered
        size = len(r.content)
        req['size'] += size

        # Method
        method = str(r.request)[18:-2]

        # Print request data
        print(color.blue('HTTP/1.1 ', status, '\t', time, 'secs:\t', size, 'bytes ==> ', method, '\t', url))
        hits += 1
    i += 1

print(color.green('\nTransactions:\t\t\t', req['trans'], '\thits'))
print(color.green('Availability:\t\t\t', (req['success'] * 100) / req['trans'], '\t%'))
print(color.green('Elapsed time:\t\t\t', round(req['time'], 2), '\tsecs'))
print(color.green('Data transfered:\t\t', round(req['size'] / 1048576, 2), '\tMB'))
print(color.green('Response time:\t\t\t', round(req['time'] / req['trans'], 2), '\tsecs'))
print(color.green('Transaction rate:\t\t', round(req['trans'] / req['time'], 2), '\ttrans/sec'))
print(color.green('Throughput:\t\t\t', round(req['size'] / 1048576 / req['time'], 2), '\tMB/sec'))
print(color.green('Concurrency:\t\t\t', '1.00'))
print(color.green('Successful transactions:\t', req['success']))
print(color.red('Failed transactions:\t\t', req['fail']))
print(color.green('Longest transactions:\t\t', req['long']))
print(color.green('Shortest transactions:\t\t', req['short']))
