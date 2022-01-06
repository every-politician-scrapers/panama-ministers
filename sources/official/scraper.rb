#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      noko.css('ul li')[1].text.tidy.delete_prefix('Su Excelencia ')
    end

    def position
      noko.css('ul li')[0].text.tidy
    end
  end

  class Members
    def member_container
      noko.css('.col-xs-12')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv if file.exist? && !file.empty?
