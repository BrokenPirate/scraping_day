require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require "awesome_print"
=begin
def deputy_finder
	@doc = Nokogiri::XML(File.open("deputy.xml"))	
	names = []




@doc.xpath('//depute').each do

  |depute_info|

  puts "\nShow Name : " + depute_info.xpath('prenom').text + depute_info.xpath('nom_de_famille')
  count=1

  depute_info.xpath('depute/emails').each do

    |depute_info|

    puts "    #{count}.Charachter : " + character_element.text
    count=count+1


end
  end




end
=end 

def deputy_finder 
doc = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml")) 

				prenom = []
            	nom_de_famille = []
            	circonscription = []
            	parti = []
            	email_pro = []
            	email_perso = []

            	



# deputes = {
#  :nom => { 
#    :prenom => prenom
#    :nom_de_famille => nom_de_famille
#  },
#  :infos => {
#    :circonscription => circo,
#    :parti => group
#  },
#  :email => {
#    :email_pro => email_pro
#  },
#}


        doc.css('depute').each do |node| 
        	
        	
                first_name = node.xpath("prenom").text,
                last_name = node.xpath("nom_de_famille").text
                circo = node.xpath("nom_circo").text
                group =  node.xpath("groupe_sigle").text
                email_assembly = node.xpath("emails/email[1]").text
                email_second = node.xpath("emails/email[2]").text
            

            	prenom << first_name
            	nom_de_famille << last_name
            	circonscription << circo
            	parti << group 
            	email_pro << email_assembly
            	email_perso << email_second

      


            	
            	# @deputes = {
            	#	:first_name => first_name ,
            	#	:last_name => last_name,
            	#	:circo => circo,
            	#	:group => group,
            	#	:email_assembly => email_assembly,
            	#	:email_second => email_second
            	# } 
        end

#@deputes = {
#        prenom => {
#{}"parti" => parti,
#{}"email pro" => email_pro,
#{}"circonscription" => circonscription
#}}

	            	@infos = prenom.zip(email_pro).to_h

	ap @infos, options = {index:         false, color: {string: :pale, hash:      :red, args:       :yellow,}}
	

end


=begin
Show Name : Married with Children
    1.Charachter : Al Bundy
    2.Charachter : Bud Bundy
    3.Charachter : Marcy Darcy

Show Name : Perfect Strangers
    1.Charachter : Larry Appleton
    2.Charachter : Balki Bartokomous
=end

deputy_finder




