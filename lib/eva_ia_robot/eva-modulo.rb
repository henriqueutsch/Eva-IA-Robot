# encoding: utf-8
require 'open-uri'
require 'nokogiri'
require 'rubygems'
require 'rbconfig'

require './eva-resposta.rb'

def evaconfig()
@listacomandos = Array.new
@listaresposta = Array.new
@listaexecutar = Array.new

File.open(Dir.pwd()+'/eva.config', 'r:utf-8') do |linha|  
  while line = linha.gets  
    # p line
    # p line.class
    # p line.index('#')
    # p line.index(':')
    # p line.index('=')
    # p line.size
    line.encoding
    comandos = line[line.index('#')+1..line.index(':')-1]
    resposta = line[line.index(':')+1..line.index('=>')-1]
    executar = line[line.index('=>')+2..line.size]
    @listacomandos << comandos.gsub('[','').gsub(']','')
    @listaresposta << resposta.gsub('[','').gsub(']','')
    @listaexecutar << executar.gsub('[','').gsub(']','').gsub('\n','')
    
  end  
end  
# puts listacomandos
# puts listaresposta
# puts listaexecutar


# p listacomandos.index('abrir chrome')
# p listaresposta[listacomandos.index('abrir chrome')]
end





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

def exit()
	@frase = 'sair'
end

def beepoff()
	@beep = 'nao'
end

def beepon()
	@beep = 'sim'
end

def feedbackon()
	@feedback = 'sim'
end

def feedbackoff()
	@feedback = 'nao'
end

def showrecordon()
	@showrecord = 'sim'
end

def showrecordoff()
	@showrecord = 'nao'
end

def exibircomandos()
	puts 'LISTA DE COMANDOS'
	puts @listacomandos
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
	when 'evaconfig'
		evaconfig()
	when 'exit'
		exit()
	when 'beepoff'
		beepoff()
	when 'beepon'
		beepon()	
	when 'feedbackon'
		feedbackon()
	when 'feedbackoff'
		feedbackoff()
	when 'showrecordon'
		showrecordon()
	when 'showrecordoff'
		showrecordoff()
	when 'exibircomandos()'
		exibircomandos()
	else
	   puts 'Módulo não encontrado'
	end
end

# modulos('hora')
# data()
# os()