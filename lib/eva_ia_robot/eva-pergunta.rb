# encoding: utf-8
# Esse código transforma audio em texto via api do google speech

# Win32/sound modulo para tocar um beep via script
require 'win32/sound'
include Win32

def pergunta(feedback,beep)
# imprimi na tela um feedback visual de quando dar o comando verbal	
	p 'gravando ...'
	# verifica se a configuração auditiva para dar o comando verbal esta setada na configuração
	if beep== true
	# Emite um som antes da gravação da voz
	 Sound.beep(1500, 200)
	end

	p "inicio gravação #{Time.now}"
	# utilizamos o sox que é um programa para gravar audio via linha de comando - no caso salva com o nome test.flac que é o formato do google
	# silence -l significa que o rec.exe grava o audio e ao perceber o silencio finaliza a gravação e salva o arquivo ja no formato permitido pelo google speech
	system('rec.exe -r 16000 test.flac silence -l 1 0.1 1% 1 1.5 1%')
	# feedback para o envio do arquivo para o google
	p 'Enviando arquivo ...'
	p "inicio envio #{Time.now}"
	# envia o arquivo test.flac para o servidor e este retorna um json
	# {\"status\":0,\"id\":\"\",\"hypotheses\":[{\"utterance\":\"abrir word\",\"confidence\":0.82485712}]}\n"
	#  status =>0 - significa sucesso
	#  status =>5 - significa que o audio não foi reconhecido
	#  atterance => texto - o texto convertido


	request = %x(wget.exe -q -U "rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=pt-BR&client=Mozilla/5.0" --post-file test.flac --header="Content-Type: audio/x-flac; rate=16000")
	# loop que corrige um bug de sair do programa quando o tempo de gravação é muito grande ou quando o json retorna algum erro ou simplesmente nulo
	begin
	# força a codificação com acento
	p request
	request.force_encoding('utf-8')
	# converte a resposta da requisição para json
	resposta = JSON.parse(request)
	p "chegada resposta #{Time.now}"
	rescue =>e
		# se houver erro ele simplesmente exibe a mensagem de erro e continua o seu processamento normal
		puts e.message
	end
#  se o status for 5, quer dizer que o texto não foi reconhecido adequadamente então ele pede para repetir o comando caso contrario ele retorna o texto
	if resposta["status"] == 5
		# a variavel feedback controla se vai ter resposta por audio ou apenas visual
		if feedback==true
		resposta("favor repêtir o comando")
		else
		puts "favor repetir o comando"
	    end
			
	else
		# pega apenas o texto do json
		resp = resposta["hypotheses"][0]["utterance"]
		puts resp
		#  retorna o texto
		return resp
	end
end

