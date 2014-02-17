# encoding: utf-8
require "cgi"
require 'open-uri'
require 'json'
require 'win32ole'
require 'rbconfig'
require 'fileutils'

load 'eva-pergunta.rb'
load 'eva-resposta.rb'
load 'versao.rb'
load 'os.rb'

module HelloWorld
  def self.say
    "Hello World!"
  end
end


shell = WIN32OLE.new('Shell.Application')
frase = ""
feedback = true
beep = true
 
while frase !="sair" do
  begin
	p frase = pergunta(feedback,beep)
  rescue =>e
    puts e.message
  end
	if frase == 'eva'
		resposta('pois não')
	end

  if frase == 'versão'
    resposta(versao())
  end

  if frase == 'desativar'
    resposta('sistema de resposta desativado')
    feedback = false
  end

    if frase == 'ativar'
    resposta('sistema de resposta ativado')
    feedback = true
  end

  if frase == 'desativar som'
    resposta('sistema de beep desativado')
    beep = false
  end

    if frase == 'ativar som'
    resposta('sistema de beep ativado')
    beep = true
  end

	if frase == 'abrir chrome'
		resposta('abrindo krome')
	shell.ShellExecute("chrome.exe", "", "", "open", 1)
	end

    if frase == 'que horas são'
    resposta("são #{Time.now.hour.to_s} horas e #{Time.now.min.to_s} minutos")
  end

      if frase == 'que dia é hoje'
    semana = ["","Segunda-feira","terça-feira","quarta-feira","quinta-feira","sexta-feira","sabado","domingo"]
mes = ["","janeiro","fevereiro","março","abril","maio","junho","julho","agosto","setembro","outubro","novembro","dezembro"]
resposta("hoje é #{semana[Time.now.wday]} dia #{Time.now.day.to_s} de #{mes[Time.now.month]} de #{Time.now.year.to_s}")
  end

    if frase == 'abrir excel'
    resposta('abrindo ekcel')
  shell.ShellExecute("excel.exe", "", "", "open", 1)
  end

      if frase == 'finalizar excel'
    resposta('finalizando ekcel')
  system("taskkill /IM excel.exe")
  end

    if frase == 'abrir word'
    resposta('abrindo word')
  shell.ShellExecute("winword.exe", "", "", "open", 1)
  end

        if frase == 'finalizar word'
    resposta('finalizando word')
  system("taskkill /IM winword.exe")
  end

  if frase == 'abrir illustrator'
  resposta('abrindo ilustreitor')
  shell.ShellExecute("illustrator.exe", "", "", "open", 1)
  end

  if frase == 'finalizar illustrator'
  resposta('finalizando ilustreitor')
  system("taskkill /IM illustrator.exe")
  end

    if frase == 'abrir prompt'
    resposta('abrindo prompt de comando')
  shell.ShellExecute("cmd.exe", "", "", "open", 1)
  end

        if frase == 'finalizar prompt'
    resposta('finalizando prompt')
  system("taskkill /IM cmd.exe")
  end


      if frase == 'sair'
    resposta('finalizando sistema de voz')
    resposta('tênha um bom dia')
  
  end


	if frase == 'sistema operacional'
		resposta("seu sistema operacional é #{os()}")
	end

	if frase == 'listar'
		resposta("exibindo lista de músicas")
		listamusicas = Array.new
        listamusicas = Dir.entries('D:/Musicas')
		listamusicas.each_with_index{ |musica,indice| p "#{indice}  #{musica}"}
	end

	if frase == 'tocar'
		resposta("exibindo lista de musicas")
		listamusicas = Array.new
        listamusicas = Dir.entries('D:/Musicas')
		listamusicas.each_with_index{ |musica,indice| p "#{indice}  #{musica}"}
	end

end