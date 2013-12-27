require "cgi"
require 'open-uri'
require 'json'
require 'win32ole'
require 'rbconfig'

shell = WIN32OLE.new('Shell.Application')

def pergunta()
	p 'gravando ...'
	system('rec.exe -r 16000 test.flac silence -l 1 0.1 1% 1 1.5 1%')
	p 'Enviando arquivo'
	request = %x(wget.exe -q -U "rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=pt-BR&client=Mozilla/5.0" --post-file test.flac --header="Content-Type: audio/x-flac; rate=16000")
	resposta = JSON.parse(request)
	# p resposta.class
	# p resposta['hypotheses']
	resp = resposta['hypotheses'][0]['utterance']
	return resp
	# p resposta['hypotheses'][0]['confidence']
end

def resposta(texto)
	texto = CGI::escape(texto)
	url = 'http://translate.google.com/translate_tts?ie=UTF-8&tl=pt&q='+texto
	  open("arquivo.mp3", "wb") do |file|
	        file.write(open(url).read)
	  end
	system('play.exe arquivo.mp3')
end

  def os
    @os ||= (
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        'windows'
      when /darwin|mac os/
        'macosx'
      when /linux/
        'linux'
      when /solaris|bsd/
        'unix'
      else
        raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
      end
    )
  end

p frase = pergunta()
if frase == 'computador'
	resposta('pois nao')
end

if frase == 'abrir chrome'
	resposta('abrindo chrome')
shell.ShellExecute("chrome.exe", "", "", "open", 1)
end

if frase == 'sistema operacional'
	resposta("seu sistema operacional e #{os()}")

shell.ShellExecute("chrome.exe", "", "", "open", 1)
end