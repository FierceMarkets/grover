# Description
#   Excellent
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   excellent - Shows an image of Mr. Burns.
#
# Notes:
#   None.
#
# Author:
#   jeremy-green

module.exports = (robot) ->
	robot.hear /(excellent)/i, (msg) ->
		imageMe msg, 'mr burns', (url) ->
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
