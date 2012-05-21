# The next Fierce publication
#
# fierce me - The next Fierce publication will be called
#
# Track arbitrary karma
#
# <thing>++ - give thing some karma
# <thing>-- - take away some of thing's karma
# karma <thing> - check thing's karma (if <thing> is omitted, show the top 5)
# karma empty <thing> - empty a thing's karma
# karma best - show the top 5
# karma worst - show the bottom 5
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
  
  incrementResponse: ->
     @increment_responses[Math.floor(Math.random() * @increment_responses.length)]
  
  decrementResponse: ->
     @decrement_responses[Math.floor(Math.random() * @decrement_responses.length)]

words = [
  "Wireless",
  "Europe",
  "Developer",
  "Mobile",
  "Content",
  "Broadband",
  "Enterprise",
  "Communications",
  "IPTV",
  "Telecom",
  "Cable",
  "Online",
  "Video",
  "Biomarkers",
  "Biotech",
  "IT",
  "Research",
  "Drug",
  "Delivery",
  "Medical",
  "Devices",
  "Pharma",
  "Manufacturing",
  "Vaccines",
  "Healthcare",
  "Practice",
  "Management",
  "Health",
  "Finance",
  "Hospital",
  "Impact",
  "EMR",
  "Payer",
  "CIO",
  "Tech",
  "Watch",
  "Government",
  "Homeland",
  "Security",
  "Compliance",
  "Energy",
  "Smart",
  "Grid",
  "Enterprise",
  "VoIP",
  "WiFi",
  "Researcher",
  "",
]

module.exports = (robot) ->
  robot.respond /(fierce)(.*)/i, (msg) ->\
    pub = msg.match[2]
    if pub
      if pub is "me"
        msg.send "http://www.mutatedcreativity.com/dev/f/logo/?pub=Fierce" + words[Math.floor(Math.random() * words.length)] + words[Math.floor(Math.random() * words.length)] + "&ext=.png"
      else
        msg.send "http://www.mutatedcreativity.com/dev/f/logo/?pub=Fierce" + pub + "&ext=.png"
    else
      msg.send "http://www.mutatedcreativity.com/dev/f/logo/?pub=Fierce" + words[Math.floor(Math.random() * words.length)] + words[Math.floor(Math.random() * words.length)] + "&ext=.png"

  robot.respond /(fierce me)/i, (msg) ->
    msg.send "http://www.mutatedcreativity.com/dev/f/logo/?pub=Fierce" + words[Math.floor(Math.random() * words.length)] + words[Math.floor(Math.random() * words.length)] + "&ext=.png"

  robot.respond /find in (project|dir|directory) (.*)/i, (msg) ->
    msg.send 'find . -type f | xargs grep -i "' + msg.match[2] + '"'

  robot.hear /(ETC|Escalate to Carson)/i, (msg) ->
    msg.send "http://www.salem-news.com/stimg/august042010/f-bomb-2.jpg"

  robot.hear /what should (i|we) do about/i, (msg) ->
    msg.send "Escalate to Carson!"

  robot.hear /(^| )alan/i, (msg) ->
    msg.send "http://www.youtube.com/watch?v=aXqkNF8fgs8"

  robot.hear /right about now/i, (msg) ->
    msg.send "Funk Soul Brother"

  robot.hear /(pause|paws)/i, (msg) ->
    msg.send "http://www.wppl.org/kidsteens/paws.jpg"

  robot.hear /(fucking|fuckin) (.*)/i, (msg) ->
    subject = msg.match[2].toLowerCase()
    karma.decrement subject
    msg.send "#{subject} #{karma.decrementResponse()} (Karma: #{karma.get(subject)})"