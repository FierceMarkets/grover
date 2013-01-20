# Description
#   Pings someone by yelling at them.
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   hubot ping <person>
#
# Notes:
#   None.
#
# Author:
#   dbarbar

module.exports = (robot) ->
  robot.respond /PING (.*)/i, (msg) ->
    yell = msg.match[1].toUpperCase() + "!"
    msg.send yell + " " + yell + " " + yell + " " + yell + " " + yell
    if msg.match[1] is 'alan'
    	msg.send 'STEVE! STEVE! STEVE! STEVE! STEVE!'
