# Description
#   Frover
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   frover - Grover will correct you
#
# Notes:
#   None.
#
# Author:
#   jeremy-green

module.exports = (robot) ->
  robot.hear /frover |gover |groover /i, (msg) ->
    msg.send 'The name\'s Grover BITCH!'
