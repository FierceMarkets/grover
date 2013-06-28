# Description
#   IT
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   it
#
# Notes:
#   None.
#
# Author:
#   Jklein


module.exports = (robot) ->
  robot.hear /it/i, (msg) ->
###    roll = Math.floor(Math.random() * 10) + 1 Cause where is the point in stopping the fun Carson?
    if roll is 1###
      msg.send "https://fiercemarkets.campfirenow.com/room/470540/uploads/4584998/fierce_it.JPG"
      