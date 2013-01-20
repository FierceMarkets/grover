# Description
#   karma
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   love and hate things
#
# Notes:
#   None.
#

class Karma

  constructor: (@robot) ->
    @cache = {}

    @increment_responses = [
      "+1!", "gained a level!", "is on the rise!", "leveled up!"
    ]

    @decrement_responses = [
      "took a hit! Ouch.", "took a dive.", "lost a life.", "lost a level."
    ]

    @robot.brain.on 'loaded', =>
      if @robot.brain.data.karma
        @cache = @robot.brain.data.karma

  kill: (thing) ->
    delete @cache[thing]
    @robot.brain.data.karma = @cache

  increment: (thing) ->
    @cache[thing] ?= 0
    @cache[thing] += 1
    @robot.brain.data.karma = @cache

  decrement: (thing) ->
    @cache[thing] ?= 0
    @cache[thing] -= 1
    @robot.brain.data.karma = @cache

  doubleDecrement: (thing) ->
    @cache[thing] ?= 0
    @cache[thing] -= 2
    @robot.brain.data.karma = @cache

  doubleIncrement: (thing) ->
    @cache[thing] ?= 0
    @cache[thing] += 2
    @robot.brain.data.karma = @cache

  incrementResponse: ->
     @increment_responses[Math.floor(Math.random() * @increment_responses.length)]

  decrementResponse: ->
     @decrement_responses[Math.floor(Math.random() * @decrement_responses.length)]

  doubleDecrementResponse: ->
     'Yeah, Fuck'

  doubleIncrementResponse: ->
     "♥ ♥"

  get: (thing) ->
    k = if @cache[thing] then @cache[thing] else 0
    return k

  sort: ->
    s = []
    for key, val of @cache
      s.push({ name: key, karma: val })
    s.sort (a, b) -> b.karma - a.karma

  top: (n = 5) ->
    sorted = @sort()
    sorted.slice(0, n)

  bottom: (n = 5) ->
    sorted = @sort()
    sorted.slice(-n).reverse()

module.exports = (robot) ->
  karma = new Karma robot
  robot.hear /(\S+[^+\s])\+\+(\s|$)/, (msg) ->
    subject = msg.match[1].toLowerCase()
    karma.increment subject
    msg.send "#{subject} #{karma.incrementResponse()} (Karma: #{karma.get(subject)})"

  robot.hear /(\S+[^-\s])--(\s|$)/, (msg) ->
    subject = msg.match[1].toLowerCase()
    karma.decrement subject
    msg.send "#{subject} #{karma.decrementResponse()} (Karma: #{karma.get(subject)})"

  robot.respond /karma empty ?(\S+[^-\s])$/i, (msg) ->
    subject = msg.match[1].toLowerCase()
    karma.kill subject
    msg.send "#{subject} has had its karma scattered to the winds."

  robot.respond /karma( best)?$/i, (msg) ->
    verbiage = ["The Best"]
    for item, rank in karma.top()
      verbiage.push "#{rank + 1}. #{item.name} - #{item.karma}"
    msg.send verbiage.join("\n")

  robot.respond /karma worst$/i, (msg) ->
    verbiage = ["The Worst"]
    for item, rank in karma.bottom()
      verbiage.push "#{rank + 1}. #{item.name} - #{item.karma}"
    msg.send verbiage.join("\n")

  robot.respond /karma (\S+[^-\s])$/i, (msg) ->
    match = msg.match[1].toLowerCase()
    if match != "best" && match != "worst"
      msg.send "\"#{match}\" has #{karma.get(match)} karma."

  robot.hear /(f'n|fuck|fuckn|fuck'n|fucking|fuckin'?) (.*)/i, (msg) ->
    subject = msg.match[2].toLowerCase()
    temp = subject.split(" ");
    subject = temp[temp.length-1];
    karma.doubleDecrement subject
    msg.send "#{karma.doubleDecrementResponse()} #{subject} (Karma: #{karma.get(subject)})"

  robot.hear /(luv|love|lovin|lov'n|loving|lovin'?) (.*)/i, (msg) ->
    subject = msg.match[2].toLowerCase()
    outputSubject = subject.charAt(0).toUpperCase() + subject.slice(1)
    karma.doubleIncrement subject
    msg.send "#{karma.doubleIncrementResponse()} #{outputSubject} #{karma.doubleIncrementResponse()} (Karma: #{karma.get(subject)})"
