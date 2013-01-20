# Description
#   Maurice
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   maurice
#   hubot maurice bomb
#   hubot maurice me
#   dance
#   happy
#
# Notes:
#   None.
#
# Author:
#   jeremy-green

module.exports = (robot) ->

  robot.hear /(maurice)/i, (msg) ->
    msg.send "https://fiercemarkets.campfirenow.com/room/470540/uploads/3090344/maurice-2.gif"

  robot.respond /maurice me/i, (msg) ->
    msg.send "https://fiercemarkets.campfirenow.com/room/470540/uploads/3090344/maurice-2.gif"

  robot.respond /maurice bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    msg.send "https://fiercemarkets.campfirenow.com/room/470540/uploads/3090344/maurice-2.gif" for i in [0...count]

  robot.hear /.*(dance|happy).*/i, (msg) ->
    msg.send "https://fiercemarkets.campfirenow.com/room/470540/uploads/3090344/maurice-2.gif"
