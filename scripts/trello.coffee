# Add trello cards to a list.
# Environment variables should include
# TRELLO_API_KEY
# TRELLO_TOKEN
# TRELLO_LIST_ID

# This is the API call
# POST /1/cards
# Required permissions: write
# Arguments
# name (required)
#  Valid Values: a string with a length from 1 to 16384
# desc (optional)
#  Valid Values: a string with a length from 0 to 16384
# idList (required)
#  Valid Values: id of the list that the card should be added to

# Example node-trello code
# var Trello = require("node-trello");
# var t = new Trello("<your key>", "<token>");
# this next line is probably very wrong.
# args = {'name' => msg.match[1], 'idList' => <thelistid>}
# t.post("/1/cards", args, function(err, data) {
#   if (err) throw err;
#   msg.send data;
# });


module.exports = (robot) ->
  robot.respond /trello add (.*)/i, (msg) ->
    msg.send "This is where I would normally add the card to the Trello list. Ideally I would respond with the URL to the card.  Somebody should build this part."

