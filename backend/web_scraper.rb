# require 'HTTParty'
# require 'Nokogiri'
# require 'JSON'
# require 'csv'
# require 'byebug'
# require 'Pry'
#
# page = HTTParty.get('https://www.angelikafilmcenter.com/nyc')
# $parse_page = Nokogiri::HTML(page)
#
# def parse_section(term, tag)
#   $parse_page.css(".#{term}").css("#{tag}").map do |node|
#     text = node.text
#   end.compact
# end[1..-1]
#
# playingTitles = parse_section('playing', 'h3')
# comingTitles = parse_section('coming', 'h3')
# comingTimes = parse_section('coming', 'h4')
#
# CSV.open('angelika.csv', 'w') do |csv|
# 	csv << playingTitles
#   csv << comingTitles
# end
