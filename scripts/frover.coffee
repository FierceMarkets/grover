module.exports = (robot) ->
  robot.hear /frover |gover |groover /i, (msg) ->
    msg.send 'The name\'s Grover BITCH!'