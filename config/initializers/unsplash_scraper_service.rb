require 'open-uri'
require 'nokogiri'

class UnsplashScraperService
  def call
    # Change just the keyword below
    keyword = "house-interior"

    url = "https://unsplash.com/s/photos/#{keyword}"
    pictures = []

    html_file = URI.open(url)
    doc_file = Nokogiri::HTML(html_file)

    doc_file.search(".YVj9w").each do |element|
      pictures << element.attr('src')
    end

    pictures[rand(0..pictures.length-1)]
  end
end
