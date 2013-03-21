# Description
#   Maximum Overdrive
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   max
#   drive
#
# Notes:
#   None.
#
# Author:
#   jeremy-green

module.exports = (robot) ->
  robot.hear /max|drive/i, (msg) ->
    roll = Math.floor(Math.random() * 10) + 1
    if roll is 1
      imageMe msg

imageMe = (msg) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", rsz: '8', q: 'maximum overdrive')
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      if images.length > 0
          image = msg.random images
          msg.send "#{image.unescapedUrl}#.png"
