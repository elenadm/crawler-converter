# -*- encoding : utf-8 -*-
# ruby version 2.4.1p111
# for start simple crawler run in console: ruby crawler/crawler.rb url_of_website

require 'net/http'

class Crawler
  def initialize(link)
    @name = link
    @visited_links = []
    @deep_lvl = 3

    counter_inputs(@name)
  end

  def counter_inputs(name, current_deep_lvl = 0)
    return if current_deep_lvl == 3
    return if @visited_links.include?(name)
    threads = []

    begin
      @visited_links << name

      uri = URI(name)
      data = Net::HTTP.get(uri)
      inputs = data.scan(/<input/).size.to_s
      p name + ' - ' + inputs + ' inputs'

      links = data.scan(/a href=\s*.?"((?:http:|https:).+?)\"/).flatten
      links.uniq.first(50).each do |link|
        if current_deep_lvl < 2
          threads << Thread.new { counter_inputs(link, current_deep_lvl + 1) }
        end
      end
      threads.each &:join
    rescue => ex
      puts ex
    end
  end
end

Crawler.new(ARGV[0])
