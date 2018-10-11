	require 'open-uri'
	require 'nokogiri'

def get_the_email_of_a_townhal_from_its_webpage(url)

	mail_parser = Nokogiri::HTML(open(url))
	puts mail_parser.css('body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)').text

end


get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")

