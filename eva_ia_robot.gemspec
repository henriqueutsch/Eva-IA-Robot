Gem::Specification.new do |s|
	s.name        = "eva-ia-robot"
	s.version     = "0.1.7"
	s.description = "Gem integrada com Google Speech e Google Translate"
	s.summary     = "Command line"
	s.author      = "Henrique Utsch"
	s.email		  = "henriqueutsch@gmail.com"
	s.homepage	  = "https://github.com/henriqueutsch/Eva-IA-Robot"
	s.files       = Dir["{lib/**/*.rb,README.rdoc,tests/**/*.rb,lib/eva_ia_robot/*.rb,lib/eva_ia_robot/*.dll,lib/eva_ia_robot/*.config,lib/eva_ia_robot/*.exe,,lib/eva_ia_robot/*.yml,lib/Rakefile,*.gemspec}"]
	s.add_dependency "cgi"
	s.add_dependency 'open-uri'
	s.add_dependency 'json'
	s.add_dependency 'fileutils'
	s.add_dependency 'nokogiri'
	s.add_dependency 'rubygems'
	s.add_dependency 'rbconfig'
	s.add_dependency 'yaml'
	s.add_dependency 'win32/sound'
	s.add_dependency 'win32ole'

end