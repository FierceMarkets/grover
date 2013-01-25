# Description
#   Display a cowboy curtis at the mention of furious or style.
#
# Dependencies:
#   None.
#
# Configuration:
#   None.
#
# Commands:
#   furious
#   style
#
# Notes:
#   None.
#
# Author:
#   jeremy-green
stations = {
  metrocenter: 'A01',
  farragutnorth: 'A02',
  dupontcircle: 'A03',
  woodleypark: 'A04',
  zoo: 'A04',
  adamsmorgan: 'A04',
  clevelandpark: 'A05',
  vanness: 'A06',
  udc: 'A06',
  tenleytown: 'A07',
  au: 'A07',
  friendshipheights: 'A08',
  bethesda: 'A09',
  medicalcenter: 'A10',
  grosvenor: 'A11',
  strathmore: 'A11',
  whiteflint: 'A12',
  twinbrook: 'A13',
  rockville:'A14',
  shadygrove: 'A15',
  farragutwest : 'C03',
  pentagon: 'C07'
}

module.exports = (robot) ->
  robot.respond /metro(.*)/i, (msg) ->
    station = msg.match[1].replace(/\s/g, '').toLowerCase() || 'farragutwest'
    station = stations[station]
    metroMe msg, station

metroMe = (msg, station) ->
  msg.http('http://api.wmata.com/StationPrediction.svc/json/GetPrediction/' + station)
    .query(api_key: 'dw7c6dfmh29bg2y3rge6rr66')
    .get() (err, res, body) ->
      body = JSON.parse(body)
      trains = body.Trains
      str = ''
      for train in trains
        str += train.DestinationName + ': ' + train.Min + '\r\n'
      msg.send str