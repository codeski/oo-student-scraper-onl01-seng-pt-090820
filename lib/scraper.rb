require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    # binding.pry
    doc = Nokogiri::HTML(open(index_url))
    na = doc.css("div.student-card")
    
    students = []
    
    na.each do |student|
      hash = {}
      hash[:name] = student.css(".card-text-container .student-name").text
      hash[:location] = student.css(".card-text-container .student-location").text
      hash[:profile_url] = student.css("a").attribute('href').value
      # binding.pry
      students << hash
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    # binding.pry
    
    hash = {}
    
    hash[:bio] = doc.css(".details-container .description-holder p").text
    hash[:profile_quote] = doc.css(".vitals-text-container .profile-quote").text
    
    social_media = doc.css(".vitals-container .social-icon-container")
    social_media.css("a").each do |media| 
     if media.attr('src') == "../assets/img/twitter-icon.png"
        hash[:twitter] = media.attr('href')
      end 
      if media.attr('src') == "../assets/img/linkin-icon.png"
        hash[:linkin] = media.attr('href')
      end 
      
      
      
      
      
      
      
      
      # if media.attr('src') == "../assets/img/twitter-icon.png"
      #   hash[:twitter] = social_media.css("a").attr('href').value
      # end
      # if media.attr('src') == "../assets/img/linkedin-icon.png"
      #   hash[:linkedin] = social_media.css("a").attr('href').value
      # end
      # if media.attr('src') == "../assets/img/github-icon.png"
      #   hash[:github] = social_media.css("a").attr('href').value
      # end
      # if media.attr('src') == "../assets/img/rss-icon.png"
      #   hash[:blog] = social_media.css("a").attr('href').value
      # end
    end 
    
    hash
  end
  
      #   if social_media.css(".social-icon").attr('src').value == "../assets/img/twitter-icon.png"
      #   hash[:twitter] = social_media.css("a").attr('href').value
      # end
      # if social_media.css(".social-icon").attr('src').value == "../assets/img/linkedin-icon.png"
      #   hash[:linkedin] = social_media.css("a").attr('href').value
      # end
      # if social_media.css(".social-icon").attr('src').value == "../assets/img/github-icon.png"
      #   hash[:github] = social_media.css("a").attr('href').value
      # end
      # if social_media.css(".social-icon").attr('src').value == "../assets/img/rss-icon.png"
      #   hash[:blog] = social_media.css("a").attr('href').value
      # end
      # hash
    
    
    # if doc.css(".vitals-container .social-icon-container .social-icon").attr('src') == ../assets/img/twitter-icon.png
    # hash[:twitter] = doc.css(.social-icon-container a).attr('href')
    # end
    # if doc.css(".vitals-container .social-icon-container a").search("twitter")
    #   )hash[:twitter] = doc.css(".vitals-container .social-icon-container a")[0].attr('href'
    # end
    # if doc.css(".vitals-container .social-icon-container a").include?("linkedin")
    #   hash[:linkedin] = doc.css(".vitals-container .social-icon-container a")[1].attr('href')
    # end
    # if doc.css(".vitals-container .social-icon-container a").include?("github")
    #   hash[:github] = doc.css(".vitals-container .social-icon-container a")[2].attr('href')
    # end
    # if doc.css(".vitals-container .social-icon-container a")
    #   hash[:blog] = doc.css(".vitals-container .social-icon-container a")[3].attr('href')
    # end
    
    
    # binding.pry
    
    
    # hash
    
    
  # end

end

