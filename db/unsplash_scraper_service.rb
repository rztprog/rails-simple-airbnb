require 'open-uri'
require 'nokogiri'

class UnsplashScraperService
  def call
    url = "https://unsplash.com/s/photos/house"

    html_file = URI.open(url)
    doc_file = Nokogiri::HTML(html_file)

    puts doc_file.search(".mItv1")
  end
end
