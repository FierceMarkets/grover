# The next Fierce publication
#
# fierce me - The next Fierce publication will be called
#

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
  robot.respond /(fierce|fierce me)/i, (msg) ->
    msg.send "http://www.mutatedcreativity.com/dev/f/logo/?pub=Fierce" + words[Math.floor(Math.random() * words.length)] + words[Math.floor(Math.random() * words.length)] + "&ext=.png"

  robot.respond /(find|search) in (project|dir)/i, (msg) ->
    msg.send 'find . -type f | xargs grep -i "sharethis"'

  robot.hear /(ETC|Escalate to Carson)/i, (msg) ->
    msg.send "http://www.salem-news.com/stimg/august042010/f-bomb-2.jpg"

  robot.hear /what should (i|we) do about/i, (msg) ->
    msg.send "Escalate to Carson!"

  robot.hear /alan/i, (msg) ->
    msg.send "http://www.youtube.com/watch?v=aXqkNF8fgs8"

  robot.hear /right about now/i, (msg) ->
    msg.send "Funk Soul Brother"

  robot.hear /(pause|paws)/i, (msg) ->
    msg.send "http://www.wppl.org/kidsteens/paws.jpg"
