# Description
#   Display a picture of Satan if anyone invokes "satan" or says "666"
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   satan
#   666
#   devil
#   lucifer
#   santa
#   stan
#
# Notes:
#   None.
#
# Author:
#   jeremy-green


module.exports = (robot) ->
  robot.hear /(satan|666|devil|lucifer|santa|stan)/i, (msg) ->
    roll = Math.floor(Math.random() * 10) + 1
    if roll is 1
      imageMe msg, msg.match[1], (url) ->
        msg.send url

imageMe = (msg, query, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", rsz: '8', q: query)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      if images.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"
