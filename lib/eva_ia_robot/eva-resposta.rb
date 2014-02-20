# Esse código transforma texto em audio via api do google Translate
require "cgi"
require 'open-uri'
def resposta(texto)
	#converte o texto para a requisição via url
	texto = CGI::escape(texto)
	#envia o texto ao servidor do google e retorna os dados de audio
	#modifique a tag pt para alterar o idioma a ser convertido
	url = 'http://translate.google.com/translate_tts?ie=UTF-8&tl=pt&q='+texto
	# abre o arquivo localmente com o nome arquivo.mp3 e escreve os dados da requisição para salva-los localmente
	  open("arquivo.mp3", "wb") do |file|
	  		#Escreve dentro do arquivo e já salva
	        file.write(open(url).read)
	  end
	# system executa um comando no prompt 
	# play.exe executa audio via linha de comando para não precisar de um player externo. 
	system('play.exe -q arquivo.mp3')
end
# resposta('abrindo chrome')