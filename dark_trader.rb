require 'rubygems'
require 'nokogiri' 
require 'open-uri'
# require 'csv'
# require 'restclient'
# require 'pry'
require "awesome_print"




#    Programme qui va récupérer le cours de toutes les cryptomonnaies
#    puis les enregistrer bien proprement dans une array de hashs


url = "https://coinmarketcap.com/"




def crypto_finder(url)

 
	crypto_name = []
	market_cap = []
	prices = []
	circulating = []


	page = Nokogiri::HTML(open(url))



	cryptoname = page.css('a.currency-name-container')
		cryptoname.each do |push|
			crypto_name << push.text
		end
	
	marketcap = page.css('.market-cap')
		 marketcap.each do |push|
			market_cap << push.text.gsub("\n","")
		 end

	price = page.css('.price')
		price.each do |push|
			prices << push.text
		end

	circulating_supply = page.css('.circulating-supply')
		circulating_supply.each do |push|
			
			circulating << push.text.gsub("\n","").gsub("*","")
		 
		end

=begin
puts crypto_name
puts market_cap
puts prices
puts circulating
=end

## YOU    NEED   TO    DO   NESTED  HASH 

crypto = {}

crypto["Crypto: "] = crypto_name
crypto["Price:"] = prices
 crypto["Market Cap:"] = market_cap
 crypto["Circulating tokens:"] = circulating

# the_crypto = 
# the_crypto_infos =


the_crypto = crypto_name.zip(prices).to_h

ap the_crypto, options = {color: {array:       :red,hash: :blue, string:     :purpleish	}}




#crypto = {
#crypto name" = crypto_name 
# }
	 
#	crypto = (
#    id => crypto_name,
#    price => prices,
#    marketcap => market_cap,
#    circulatingsupply => circulating
#    )
   


#	currencies tbody tr market-cap
#	currencies tbody tr price 
#	currencies tbody tr circulating-supply
end


n = 3600

	def every_n_seconds(n)
	  loop do
	    before = Time.now
	    yield
	    interval = n-(Time.now-before)
	    sleep(interval) if interval > 0
	  end
	end


	every_n_seconds(n) do
		crypto_finder(url)
		puts "CTRL + C pour quitter : \n Actualisation dans :" 
		n.downto(0) do |i|
  			print "#{'%02d' % i}       s  \r			"
  		sleep 1
		end   
	end




