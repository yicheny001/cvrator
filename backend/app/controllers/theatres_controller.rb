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

  def angelika
    playingTitles = parse_section('playing', 'h3')
    comingTitles = parse_section('coming', 'h3')
    comingTimes = parse_section('coming', 'h4')
    data = {'playingTitles':playingTitles}
    # CSV.open('angelika.csv', 'w') do |csv|
    # 	csv << playingTitles
    #   csv << comingTitles
    # end
    print playingTitles
    render json: data
  end

end
