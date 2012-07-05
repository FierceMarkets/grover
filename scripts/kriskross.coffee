module.exports = (robot) ->
  robot.hear /((c|k)riss|(c|k)ross)/i, (msg) ->
    msg.send 'JUMP! JUMP!'
