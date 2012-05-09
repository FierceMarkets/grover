# MauriceME
#
# maurice - Maurice dancing
# maurice bomb N - get N Maurices dancing
# happy|dance - Maurice dancing

module.exports = (robot) ->

  robot.hear /(maurice)/i, (msg) ->
    msg.send "https://fiercemarkets.campfirenow.com/room/470540/uploads/3090344/maurice-2.gif"

  robot.respond /maurice me/i, (msg) ->
    msg.send "https://fiercemarkets.campfirenow.com/room/470540/uploads/3090344/maurice-2.gif"

  robot.respond /maurice bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    maurice = "https://fiercemarkets.campfirenow.com/room/470540/uploads/3090344/maurice-2.gif"
    msg.send maurice for count