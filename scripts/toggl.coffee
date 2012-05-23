# Show toggl status
#
# hubot toggl keyadd <yourapikey> - Remember my toggl api key
# hubot toggl keydel - Forget my toggl api key
# hubot toggl status - Show my recent time entries
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
    resp = ""
    users = [msg.message.user]
    users.forEach (user) ->
      if user.togglKey?
        encodedAuth = new Buffer(user.togglKey + ':api_token').toString('base64')

        msg
          .http("https://www.toggl.com/api/v6/time_entries.json")
          .header('Authorization', 'Basic ' + encodedAuth)
          .get() (err, res, body) ->

            resp += user.name + "\n";
            results = JSON.parse(body)
            if results.error
              results.error.errors.forEach (err) ->
                resp += err.message
            else
              item = results[results.length - 1]
              resp += item.start + " - " + item.description
              if item.duration < 0
                resp += " - doing"
              else
                resp += " - " + item.duration + " sec"

            resp += "\n"

    msg.send resp
