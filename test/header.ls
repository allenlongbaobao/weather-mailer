debug = require('debug')('weather-mailer')

require! [should, './helper', '../bin/config']

base-url = "http:localhost:#{config.port}"

can = it
