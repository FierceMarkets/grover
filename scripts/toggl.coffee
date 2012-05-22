# Get our toggl statuses
#

module.exports = (robot) ->
  robot.respond /toggl keyadd (.*)/i, (msg) ->
    togglKey = msg.match[1]
    msg.message.user.togglKey = togglKey
    msg.send "Ok, " + msg.message.user.name + ", I added your toggl key."

  robot.respond /toggl keydel (.*)/i, (msg) ->
    user = msg.message.user
    user.togglKey = null
    msg.reply("Ok, I lost your toggl key.")

  robot.respond /toggl status/i, (msg) ->
    msg.send "Stub function.  This is where I would loop through the api keys I have stored and display that status for each of you."
