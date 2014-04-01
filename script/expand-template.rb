#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'erb'

def superchomp(str)
  str.gsub(/^\s*/, '').gsub(/\s*$/, '')
end

component_id = ARGV[1]
d = Nokogiri::HTML(open("https://components.xamarin.com/view/#{component_id}"))

component_version = d.css("h1 .version").text.strip
component_title = d.css('.component-detail h1').first.text.gsub(component_version, '').strip
component_summary = d.css(".component-detail .description p").text
component_description = d.css(".component-about p").first.text
component_author = d.css("p.publisher a").text.gsub("\r\n", '').strip

erb = ERB.new(File.read(ARGV[0]))
puts erb.result(binding)

## Platform list
#p d.css("ul.platforms li").map {|x| x.attributes['class'].value }
