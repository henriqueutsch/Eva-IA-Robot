def resposta(texto)
	texto = CGI::escape(texto)
	url = 'http://translate.google.com/translate_tts?ie=UTF-8&tl=pt&q='+texto
	  open("arquivo.mp3", "wb") do |file|
	        file.write(open(url).read)
	  end
	system('play.exe arquivo.mp3')
end