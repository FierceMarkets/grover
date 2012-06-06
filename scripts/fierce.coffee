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
  robot.respond /fierce( )?(.*)/i, (msg) ->
    pub = msg.match[2] || ''
    if pub is ''
      msg.send "https://secure.fiercemarkets.com/fierceme?pub=Fierce" + words[Math.floor(Math.random() * words.length)] + words[Math.floor(Math.random() * words.length)] + "&ext=.png"
    else
      if pub is "me"
        msg.send "https://secure.fiercemarkets.com/fierceme?pub=Fierce" + words[Math.floor(Math.random() * words.length)] + words[Math.floor(Math.random() * words.length)] + "&ext=.png"
      else if pub is "bomb"
        count = 5
        msg.send "https://secure.fiercemarkets.com/fierceme?pub=Fierce" + words[Math.floor(Math.random() * words.length)] + words[Math.floor(Math.random() * words.length)] + "&ext=.png" for i in [0...count]
      else
        w = pub.split(" ")
        len = w.length
        i = 0
        while i < len
          w[i] = w[i].charAt(0).toUpperCase() + w[i].slice(1)
          i++
        pub = w.join("")
        msg.send "https://secure.fiercemarkets.com/fierceme?pub=Fierce" + pub + "&ext=.png"

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

  robot.hear /(phil|philip|phillip)/i, (msg) ->
    msg.send "https://fiercemarkets.campfirenow.com/room/470540/uploads/3179113/philweb1.jpg"