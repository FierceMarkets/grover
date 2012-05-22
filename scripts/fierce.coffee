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
    pub = msg.match[2]
    if pub
      if pub is "me"
        msg.send "http://www.mutatedcreativity.com/dev/f/logo/?pub=Fierce" + words[Math.floor(Math.random() * words.length)] + words[Math.floor(Math.random() * words.length)] + "&ext=.png"
      else
        `words = pub.split(' ');
        len = words.length;
        for(i=0; i<len; i++) {
          words[i] = words[i].charAt(0).toUpperCase() + words[i].slice(1);
        }
        pub = words.join('');`
        msg.send "http://www.mutatedcreativity.com/dev/f/logo/?pub=Fierce" + pub + "&ext=.png"
        pub = ''
    else
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
