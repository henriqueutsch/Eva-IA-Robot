#!/bin/env ruby
# encoding: utf-8
require 'win32/sound'
include Win32


def pergunta(feedback,beep)
	p 'gravando ...'
	if beep== true
	 Sound.beep(1500, 200)
	end
	system('rec.exe -r 16000 test.flac silence -l 1 0.1 1% 1 1.5 1%')
	p 'Enviando arquivo ...'
	request = %x(wget.exe -q -U "rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=pt-BR&client=Mozilla/5.0" --post-file test.flac --header="Content-Type: audio/x-flac; rate=16000")
	begin
	request.force_encoding('utf-8')
	resposta = JSON.parse(request)
	rescue =>e
		puts e.message
	end
	if resposta["status"] == 5
		if feedback==true
		resposta("favor repêtir o comando")
		else
		puts "favor repetir o comando"
	    end
			
	else
		resp = resposta["hypotheses"][0]["utterance"]
		puts resp
		return resp
	end
end

