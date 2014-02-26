debug = require('debug')('weather-mailer')
require! [http, should, request, '../../bin/config/config', '../helper']

base-url = "http://localhost:#{config.port}"

can = it


