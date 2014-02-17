# encoding: utf-8
require 'open-uri'
require 'nokogiri'
require 'rubygems'


def versao(teste)
pagina = Nokogiri::HTML(open("http://rubygems.org/gems/eva-ia-robot"))
vremota = pagina.xpath("/html/body/div/div[3]/div[1]/div[1]").text
vremota = vremota.gsub(/[^0-9.]/,'')
p vremota


name = /^/i
dep = Gem::Dependency.new(name, Gem::Requirement.default)
specs = Gem.source_index.search(dep)
vlocal = ""
# specs.map{ |s| puts "#{s.version}" if s.name=="eva-ia-robot"}
specs.map{ |s| vlocal = s.version if s.name=="eva-ia-robot"}
vlocal = vlocal.to_s
p vlocal
vremota= teste
if vlocal==vremota 
	return "Sua versão é a mais atual"
else 
	return "Existe uma atualização disponível"
end

end

# p v = versao("0.2.1")
