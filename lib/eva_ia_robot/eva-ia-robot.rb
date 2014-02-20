# encoding: utf-8
#1 - falta corrigir o erro em eva-pergunta.rb
# antes do rescue
# 706: unexpected token at '{"status":5,"id":"","hypotheses":[]}
# 706: unexpected token at '{"status":0,"id":"","hypotheses":[{"utterance":"desativar","confidence":0.86765343}]}
# A JSON text must at least contain two octets!
# undefined method `[]' for nil:NilClass
#2 - ao executar um programa
# [Decode error - output not utf-8]
# 3 - repetição de comando
# limpar alguma variavel
# 4 - criar o tempo de resposta
# 5 - problemas ao listar comandos
# modulos do ruby para instalar basta abrir o prompt de comando e digitar "gem install [nome]" ex: "gem install win32ole"
require 'win32ole'
require 'yaml'
# carrega os arquivos .rb
require './eva-pergunta.rb'
require './eva-resposta.rb'
require './eva-modulo.rb'

# teste mas ainda não sei como vou fazer isso.
module HelloWorld
  def self.say
    "Hello World!"
  end
end

class Time
  def to_ms
    (self.to_f * 1000.0).to_i
  end
end

shell = WIN32OLE.new('Shell.Application')
cnf = YAML::load(File.open('config.yml'))
@frase = ""
@feedback = cnf['feedback']
@beep = cnf['beep']
@showrecord = cnf['showrecord']


evaconfig()

while @frase !="sair" do


  begin
    # puts start_time = Time.now
  @frase = pergunta()
  puts "Usuario: #{@frase}"
  rescue =>e
    puts e.message
  end



  if @listacomandos.include? @frase
    
    if @listaexecutar[@listacomandos.index(@frase)].include? '%'
      p abrir = @listaexecutar[@listacomandos.index(@frase)].gsub('%',"").gsub("\n",'')
      shell.ShellExecute(abrir, "", "", "open", 1)
    end

    if @listaexecutar[@listacomandos.index(@frase)].include? '&'
      p fechar = @listaexecutar[@listacomandos.index(@frase)].gsub('&',"").gsub("\n",'')
      system("taskkill /IM #{fechar}")
    end

    if @listaexecutar[@listacomandos.index(@frase)].include? '$'
      p executar = @listaexecutar[@listacomandos.index(@frase)].gsub('$',"").gsub("\n",'')
      modulos(executar)
    end

    if @listaresposta[@listacomandos.index(@frase)].include? '$'
      p executar = @listaresposta[@listacomandos.index(@frase)].gsub('$',"")
      modulos(executar)
      else
        p "EVA: #{@listaresposta[@listacomandos.index(@frase)]}"
        resposta(@listaresposta[@listacomandos.index(@frase)])
        
    end
  end
  # puts end_time = Time.now
  # puts elapsed_time = end_time.to_ms - start_time.to_ms  # => 3004

end