#!/bin/python
import json

conf = {}
conf['timelimit'] = int(input('Time limit(in ms): '))
conf['memlimit'] = int(input('Memory limit(in bytes): '))
conf['compile'] = input('Compile type(g++/makefile): ')
conf['score'] = 'rate'
conf['check'] = 'diff'

groups = []

group_number = int(input('How many groups of testcases do you want to put: '))
for i in range(1, group_number+1):
    print ('\nGroup ', i)
    testcase = {}
    testcase['weight'] = int(input('Group weight? '))
    data = input('Group data?(ex: 1,2) ')
    testcase['data'] = []
    ds = data.split(',')
    for t in ds:
        testcase['data'].append(int(t))
    groups.append(testcase)

conf['test'] = groups

open('/tmp/sprout-prob/conf.json', 'w').write(json.dumps(conf))
