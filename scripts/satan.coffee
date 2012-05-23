# Display a picture of Satan if anyone invokes "satan" or says "666"

images = [
  "http://images1.wikia.nocookie.net/__cb20110922210808/uncyclopedia/images/0/0c/Satandrawing.jpg"
  "http://img.photobucket.com/albums/v418/bawanaal/satan.jpg"
  "http://www.borowitzreport.com/wp-content/uploads/satan3.jpg"
  "http://upload.wikimedia.org/wikipedia/en/e/e7/Satan_Pit.jpg"
  "http://www.zap2it.com/media/photo/2009-02/45296660.jpg"
  "http://freakipedia.net/images/1/1d/Satan.jpg"
  "http://www2.ic.edu/aporter/docs/361/south-park-SatanSad4_couch_revised_big.jpg"
  "http://diablo3guideonline.files.wordpress.com/2012/04/diablo1.jpg"
  "http://softsupplier.com/wp-content/plugins/jobber-import-articles/photos/136495-running-diablo-iii-what-hardware-do-you-need.jpg"
]

module.exports = (robot) ->
  robot.hear /(satan|666)/i, (msg) ->
    msg.send msg.random images
