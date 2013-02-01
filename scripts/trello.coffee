# Add trello cards to a list.
#
# hubot trello add <cardname> - Adds a card with the given text to a predefined list

# Environment variables
# TRELLO_API_KEY
# The API key of your app.
# TRELLO_TOKEN
# The token of the user you want cards created as.  Should have read,write permission.
# TRELLO_LIST_ID
# The list ID of the list you want cards to go in.

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
# var t = new Trello(process.env.TRELLO_API_KEY, process.env.TRELLO_TOKEN);
# args =
#  name: msg.match[1]
#  idList: process.env.TRELLO_LIST_ID
# t.post("/1/cards", args, function(err, data) {
#   if (err) throw err;
#   msg.send data;
# });

module.exports = (robot) ->
  robot.respond /trello add (.*)/i, (msg) ->
    subject = msg.match[1]
    unless process.env.TRELLO_API_KEY?
      msg.send "Please specify the Trello API key in TRELLO_API_KEY"
      return
    unless process.env.TRELLO_TOKEN?
      msg.send "Please specify the Trello token in TRELLO_TOKEN"
      return
    args =
      name: subject
      idList: '510acfdfeca4af654e004e85'
    trelloIt subject, args, msg

  robot.hear /^we (sh|c)ould (.*)/i, (msg) ->
    subject = msg.match[2]
    unless process.env.TRELLO_API_KEY?
      msg.send "Please specify the Trello API key in TRELLO_API_KEY"
      return
    unless process.env.TRELLO_TOKEN?
      msg.send "Please specify the Trello token in TRELLO_TOKEN"
      return
    args =
      name: subject
      idList: '510acfdfeca4af654e004e85'
    trelloIt subject, args, msg

  robot.hear /^http(s?):\/\/(.*)/i, (msg) ->
    url = msg.match[0]
    unless process.env.TRELLO_API_KEY?
      msg.send "Please specify the Trello API key in TRELLO_API_KEY"
      return
    unless process.env.TRELLO_TOKEN?
      msg.send "Please specify the Trello token in TRELLO_TOKEN"
      return
    jsdom = require 'jsdom'
    jsdom.env(
      html: msg.match[0]
      scripts: [
        'http://code.jquery.com/jquery-1.7.2.min.js'
      ]
      done: (errors, window) ->
        unless errors
          $ = window.$
          title = $('title').text()

          if title
            title = title
            list = '510acfdfeca4af654e004e84'
          else
            title = url
            list = '510be43bbfd03ea75700314b'
          args =
            name: title
            idList: list
            desc: url

          trelloIt url, args, msg
    )

trelloIt = (subject, args, msg) ->
  Trello = require("node-trello");
  t = new Trello(process.env.TRELLO_API_KEY, process.env.TRELLO_TOKEN);

  t.post "/1/cards", args, (err, data) ->
    msg.send err if err
    msg.send "Added card: " + args.name + " - " + data.url