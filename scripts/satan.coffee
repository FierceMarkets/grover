# Display a picture of Satan if anyone invokes "satan" or says "666"

module.exports = (robot) ->
  robot.hear /(satan|666|devil|lucifer|santa|stan)/i, (msg) ->
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