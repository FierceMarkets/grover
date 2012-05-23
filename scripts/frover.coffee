module.exports = (robot) ->
  robot.hear /frover /i, (msg) ->
    msg.send 'The name\'s Grover BITCH!'