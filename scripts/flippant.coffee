# Description
#   Display a cowboy curtis at the mention of furious or style.
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   furious
#   style
#
# Notes:
#   None.
#
# Author:
#   jeremy-green

###module.exports = (robot) ->
  robot.hear /(.*)/i, (msg) ->
    if msg.message.user.name is 'Carson Evans'
    	msg.reply 'Stop being so FLIPPANT!'###