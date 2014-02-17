require 'open-uri'
require 'nokogiri'

pagina = Nokogiri::HTML(open("http://www.vagrantbox.es/"))



nome,link,tamanho,lista = Array.new
 nome = pagina.xpath("//table/tbody/tr/th").map {|texto|  texto.text}
 link = pagina.xpath("//table/tbody/tr/td[2]").map {|texto|  texto.text}
 tamanho = pagina.xpath("//table/tbody/tr/td[3]").map {|texto|  texto.text}
 indice = Array.new(tamanho.count) {|i| i+1}
lista = indice,nome,link,tamanho
# lista = puts pagina.xpath("//div/a").text.split('-')
# puts pagina.xpath("//div/a").map {|texto| texto['onclick'].split("'")[1]}
# puts pagina.xpath("//div/a").map {|texto| texto['onclick'].split("'")[3]}

p "inicio"
p link[58]
system("dir")
p system("vagrant box add Freebsd2 #{link[58]}")

# pkg_add -r samba36
# NET SHARE vagrant=D:\vagrant "/grant:TODOS,FULL"
# NET SHARE $nomecomp=$caminho "/grant:$User,FULL|READ|WRITE"


# mount_smbfs -I 192.168.2.145 //Utsch@UTSCH-PC/Vagrant /usr/home/vagrant 
# sudo mount_smbfs -I 192.168.2.145 //Utsch@UTSCH-PC/Vagrant /usr/home/vagrant 


# VM Config = "/vagrant D:/Vagrant"