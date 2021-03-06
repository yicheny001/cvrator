var express = require('express');
var fs      = require('fs');
var request = require('request');
var cheerio = require('cheerio');
var app     = express();

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.get('/scrape', function(req, res){

  console.log("what should we name this app?!")

  url = 'https://www.angelikafilmcenter.com/nyc';

  request(url, function(error, response, html){
    if(!error){
      var $ = cheerio.load(html);

      var title, release, rating;
      var json = { title : "", release : "", rating : ""};

      $('.playing li').filter(function(){
        debugger
        var data = $(this);
        console.log(data)
        json.title = title;
        json.release = release;
      })

      $('.ratingValue').filter(function(){
        var data = $(this);
        rating = data.text().trim();

        json.rating = rating;
      })
    }

    var jsonData = JSON.stringify(json, null, 4)
    res.json(jsonData)

  })
})

app.listen('8081')
console.log('Magic happens on port 8081');
exports = module.exports = app;
