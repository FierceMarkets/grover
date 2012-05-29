module.exports = (robot) ->

images = [
  "https://fiercemarkets.campfirenow.com/room/470540/uploads/3081235/rush.jpg"
  "http://mustachify.me/0?src=http://farm1.staticflickr.com/56/113668068_1d3aae11b8_z.jpg"
  "http://farm1.staticflickr.com/56/113668068_1d3aae11b8_z.jpg"
]

module.exports = (robot) ->
  robot.respond /carson bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    for i in [0...count]
	    imageMe msg, 'carson evans', (url) ->
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