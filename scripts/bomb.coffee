# Description
#   Provides various bombs to enterain us.
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   hubot <something> bomb - Bomb!
#
# Notes:
#   None.
#
# Author:
#   jeremy-green


module.exports = (robot) ->
  robot.respond /(.*) bomb( (\d+))?/i, (msg) ->
    subject = msg.match[1]
    if subject isnt "carson" and subject isnt "corgi" and subject isnt "pug" and subject isnt "maurice" and subject isnt "fierce"
      if subject is "starving"
        subject = "puppy"
      count = msg.match[2] || 5
      imageMe msg, count, subject

imageMe = (msg, count, query) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", rsz: '8', q: query)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      if images.length > 0
        for i in [0...count]
          image = images[i]
          msg.send "#{image.unescapedUrl}#.png"
