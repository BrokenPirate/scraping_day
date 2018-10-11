require 'nokogiri'
require 'open-uri'


def emails(url)

	

    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + url))
    scraper = page.css("body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)").text  

end


def get_all_url
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")) #pageweb a scrape
    all_url = doc.css(".lientxt") # URLs a chercher = .lientext -> stock dans all_url

    url_list = [] #array pour stocker les url + methode email

    all_url.each do |link| # chaque Url a chercher dans la page
        mail = emails(link['href']) # utilise la methode mail (pour recup mail) avec le href recupérer 
        print "#{mail}             \r" # Pour afficher sur la même ligne chaque mail
        if mail == nil # Si le mail n'est pas renseigné
  			mail = "Email non renseigné" # email = email non renseigné
  			url_list << mail # push dans url_list
  		else
   		url_list << mail # si le mail est renseigné, push dans url_list

   		 #emails(link['href']) 
   		# puts email_val
   		end

end
# all_url.css(".lientxt").text 
puts url_list #afficher le tableau puts url
end

get_all_url




