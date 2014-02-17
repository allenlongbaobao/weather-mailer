debug = require('debug')('weather-mailer')
require! [http, should, '../../bin/config/config', '../helper']

base-url = "http://localhost:#{config.port}"

can = it


