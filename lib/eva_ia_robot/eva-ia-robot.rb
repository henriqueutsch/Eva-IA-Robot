# encoding: utf-8
# comandos.conf 
# caminho completo execução Dir.pwd
# documentar caminho completo
#  modulos do ruby para instalar basta abrir o prompt de comando e digitar "gem install [nome]" ex: "gem install win32ole"
require "cgi"
require 'open-uri'
require 'json'
require 'win32ole'
require 'rbconfig'
require 'fileutils'

# carrega os arquivos .rb tentei com require mas não funcionou
load 'eva-pergunta.rb'
load 'eva-resposta.rb'
load 'versao.rb'
load 'os.rb'

# teste mas ainda não sei como vou fazer isso.
module HelloWorld
  def self.say
    "Hello World!"
  end
end

# tentei abrir o programa pelo system() mas não funcionou direito o WIN32OLE é uma biblioteca "dll" do windows
shell = WIN32OLE.new('Shell.Application')
# inicializa configuração
frase = ""
feedback = true
beep = true

 #  loop para ficar gravando o comando de voz repetidamente so sai do loop e finaliza o sistema se o comando "sair" for executado
while frase !="sair" do
  # se houver algum erro ele imprimi e continua o processamento
  begin
    # chama o procedimento pergunta para gravar o audio 
    # feedback true - habilita a resposta para repetir o comando
    # feedback = false - desabilita a resposta para repetir o comndo
    #  beep = true - habilita beep antes da gravação
    #  beep = false - desabilita beep antes da gravação

    #  a referência sobre a pergunta encontra-se no arquivo eva-pergunta.rb
	p frase = pergunta(feedback,beep)
  rescue =>e
    #  se houver erro simplesmente imprime
    puts e.message
  end

  # OBSERVAÇÃO---------------------------------------
  # Você pode alterar o valor de frase e de resposta.

  # se a conversão do audio gravado em texto for igual a frase, ele executa os comandos e o feedback auditivo do sistema. 
	if frase == 'eva'
    # quando o usuário dar o comando eva o sitema responde falando "pois não"
    # a referência sobre a resposta encontra-se no arquivo eva-resposta.rb
		resposta('pois não')
	end

  if frase == 'versão'
    # recebe a verificação da versão do sistema
    resposta(versao())
  end

  # desativa o feedback com o conteúdo "favor repetir o comando"
  if frase == 'desativar'
    resposta('sistema de resposta desativado')
    feedback = false
  end

  # ativa o feedback com o conteúdo "favor repetir o comando"
  if frase == 'ativar'
    resposta('sistema de resposta ativado')
    feedback = true
  end

   # desativa o feedback com o conteúdo "favor repetir o comando"
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
      p "inicio execução #{Time.now}"
        shell.ShellExecute("winword.exe", "", "", "open", 1)
    resposta('abrindo word')
    p "final execução #{Time.now}"

  end

  if frase == 'finalizar word'
          system("taskkill /IM winword.exe")
    resposta('finalizando word')
  
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