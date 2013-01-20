# Description
#   Jump Jump
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   variations of krisskross
#
# Notes:
#   None.
#
# Author:
#   jeremy-green

module.exports = (robot) ->
  robot.hear /((c|k)riss|(c|k)ross)/i, (msg) ->
    msg.send 'JUMP! JUMP!'
