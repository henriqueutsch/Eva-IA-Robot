# encoding: utf-8
require 'open-uri'
require 'nokogiri'
require 'rubygems'
require 'rbconfig'

load 'eva-resposta.rb'
 def os
    @os ||= (
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        resposta('seu sistema operacional é windous')
      when /darwin|mac os/
        resposta('seu sistema operacional é macosx')
      when /linux/
        resposta('seu sistema operacional é linux')
      when /solaris|bsd/
        resposta('seu sistema operacional é unix')
      else
        raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
      end
    )
  end

def versao()
	pagina = Nokogiri::HTML(open("http://rubygems.org/gems/eva-ia-robot"))
	vremota = pagina.xpath("/html/body/div/div[3]/div[1]/div[1]").text
	vremota = vremota.gsub(/[^0-9.]/,'')
	puts vremota


	name = /^/i
	dep = Gem::Dependency.new(name, Gem::Requirement.default)
	specs = Gem.source_index.search(dep)
	vlocal = ""
	# specs.map{ |s| puts "#{s.version}" if s.name=="eva-ia-robot"}
	specs.map{ |s| vlocal = s.version if s.name=="eva-ia-robot"}
	vlocal = vlocal.to_s
	puts vlocal
	# vremota= teste
	if vlocal==vremota 
		resposta("Sua versão é a mais atual")
	else 
		resposta("Existe uma atualização disponível")
	end

end


def data()
	    semana = ["","Segunda-feira","terça-feira","quarta-feira","quinta-feira","sexta-feira","sabado","domingo"]
mes = ["","janeiro","fevereiro","março","abril","maio","junho","julho","agosto","setembro","outubro","novembro","dezembro"]
resposta("hoje é #{semana[Time.now.wday]} dia #{Time.now.day.to_s} de #{mes[Time.now.month]} de #{Time.now.year.to_s}")
end

def hora()
    resposta("são #{Time.now.hour.to_s} horas e #{Time.now.min.to_s} minutos")
end

def modulos(modulo)
	case modulo
	when 'hora'
	   hora()
	when 'versao'
	   versao()
	when 'data'
	   data()   
	when 'sistema'
		os()
	else
	   puts 'erro 1'
	end
end

# modulos('hora')
# data()
# os()