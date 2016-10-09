require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'csv'
require 'byebug'
require 'Pry'




class TheatresController < ApplicationController

  def parse_section(term, tag)
    page = HTTParty.get('https://www.angelikafilmcenter.com/nyc')
    $parse_page = Nokogiri::HTML(page)
    $parse_page.css(".#{term}").css("#{tag}").map do |node|
      text = node.text
    end.compact
  end[1..-1]

  def parse_playing
    page = HTTParty.get('https://www.angelikafilmcenter.com/nyc/showtimes-and-tickets/now-playing')
    $parse_page = Nokogiri::HTML(page)
    movies = []
    $parse_page.css(".film").map do |film|
      title = film.css('.name a').text
      times = []
      film.css('.showtimes-wrapper a').map do |time|
        times.push(time.text)
      end
      desc = film.css('.desc p').text
      movie = Movie.create
      movie.title = title
      movie.desc = desc
      movie.times = times
      movies.push(movie)
    end
    render json: movies
  end


  def angelika
    parse_playing
  end

  # def angelika
  #   playingTitles = parse_section('playing', 'h3')
  #   byebug
  #   comingTitles = parse_section('coming', 'h3')
  #   comingTimes = parse_section('coming', 'h4')
  #   data = {'playingTitles':playingTitles}
  #   # CSV.open('angelika.csv', 'w') do |csv|
  #   # 	csv << playingTitles
  #   #   csv << comingTitles
  #   # end
  #   print playingTitles
  #   render json: data
  # end

  def ifc
  end

end
