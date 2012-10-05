#!/usr/bin/env ruby

## provide this line in .bashrc if you want to output only for xterm
#	if [ "$TERM" == "xterm" ]; then <script_dir>/wiki_rocznice.rb ; fi


require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://pl.wikipedia.org/wiki/Main_Page"))

lines_of_text = page.css('div#mp-otd').text.split(/\n/)[0...-1]
lines_of_text.insert(0, page.css('h2#mp-otdHead').text + Date.today.strftime(" %d.%m"))
lines_of_text.reject! { |line| line.size == 0}

puts lines_of_text
