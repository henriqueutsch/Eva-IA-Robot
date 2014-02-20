# encoding: utf-8
# comandos.conf 
# documentar caminho completo
# modulos do ruby para instalar basta abrir o prompt de comando e digitar "gem install [nome]" ex: "gem install win32ole"
require "cgi"
require 'open-uri'
require 'json'
require 'win32ole'
require 'rbconfig'
require 'fileutils'


# carrega os arquivos .rb tentei com require mas não funcionou
load 'eva-pergunta.rb'
load 'eva-resposta.rb'
load 'eva-modulo.rb'

shell = WIN32OLE.new('Shell.Application')
frase = ""
feedback = true
beep = true
listacomandos = Array.new
listaresposta = Array.new
listaexecutar = Array.new

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

    comandos
    listacomandos << comandos.gsub('[','').gsub(']','')
    listaresposta << resposta.gsub('[','').gsub(']','')
    listaexecutar << executar.gsub('[','').gsub(']','').gsub('\n','')
    
  end  
end  
# puts listacomandos
# puts listaresposta
# puts listaexecutar


# p listacomandos.index('abrir chrome')
# p listaresposta[listacomandos.index('abrir chrome')]


while frase !="sair" do


  begin
  p frase = pergunta(feedback,beep)
  rescue =>e
    puts e.message
  end



  if listacomandos.include? frase
    
    if listaexecutar[listacomandos.index(frase)].include? '%'
      p abrir = listaexecutar[listacomandos.index(frase)].gsub('%',"").gsub("\n",'')
      shell.ShellExecute(abrir, "", "", "open", 1)
    end

    if listaexecutar[listacomandos.index(frase)].include? '&'
      p fechar = listaexecutar[listacomandos.index(frase)].gsub('&',"").gsub("\n",'')
      system("taskkill /IM #{fechar}")
    end

    if listaresposta[listacomandos.index(frase)].include? '$'
      p executar = listaresposta[listacomandos.index(frase)].gsub('$',"")
      modulos(executar)
      else
        resposta(listaresposta[listacomandos.index(frase)])
        puts listaresposta[listacomandos.index(frase)]
    end
  end
end