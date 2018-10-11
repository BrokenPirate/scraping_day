require 'rubygems'
require 'nokogiri' 
require 'open-uri'
# require 'csv'
# require 'restclient'
# require 'pry'
require "awesome_print"



PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

municipality = []
email_val = []
info_val = Hash[municipality.zip(email_val)]


def get_all_the_urls_of_val_doise_townhalls
		municipality = []
		email_val = []

  page = Nokogiri::HTML(open(PAGE_URL)) 

  links = page.css(".lientxt") 

  	links.each do |link|
  		check_nil = get_the_email_of_a_townhal_from_its_webpage(link['href'])

  		print "#{check_nil}             \r"

  		if check_nil == nil
  			check_nil = "Email non renseigné"
  			email_val << check_nil
  		else
   		email_val << get_the_email_of_a_townhal_from_its_webpage(link['href'])
   		# puts email_val
   	end

  	end 

  
    links.each do |city|
  		municipality << city.text
  		# puts municipality
  	end

  
  	info_val = Hash[municipality.zip(email_val)]

  ap info_val

  puts "============================================================================================="
  

  
end

def get_the_email_of_a_townhal_from_its_webpage(url)
	
	mail_parser = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + url))
	mailer = (mail_parser.css('body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)').text)
	
end




get_all_the_urls_of_val_doise_townhalls

