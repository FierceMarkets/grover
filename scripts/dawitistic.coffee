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

module.exports = (robot) ->
  robot.hear /dawit?/i, (msg) ->
    dawitMe msg

dawitMe = (msg) ->
  msg.http('http://dawitistics.com/dawitistic.txt')
    .get() (err, res, body) ->
      msg.send body
