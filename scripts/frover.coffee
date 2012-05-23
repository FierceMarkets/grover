module.exports = (robot) ->
  robot.hear /frover /i, (msg) ->
    msg.send 'The names Grover BITCH!'