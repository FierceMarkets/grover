module.exports = (robot) ->
  robot.respond /(.*) bomb( (\d+))?/i, (msg) ->
    subject = msg.match[1]
    count = msg.match[2] || 5
    for i in [0...count]
	    imageMe msg, subject, (url) ->
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