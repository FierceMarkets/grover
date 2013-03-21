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
    roll = Math.floor(Math.random() * 5) + 1
    if roll is 1
        msg.send 'JUMP! JUMP!'
