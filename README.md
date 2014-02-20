Eva-IA-Robot
============

Voice command  your computer<br>

1 - Integração com Google Translate para obter o audio
<pre><code>http://translate.google.com/</code></pre>
2 - Integração com Google Speech para obter o texto da fala
<pre><code>https://www.google.com/intl/pt/chrome/demos/speech.html</code></pre>
3 - Sox para Play e Rec
<pre><code>http://sox.sourceforge.net/</code></pre>
4 - Wget para enviar o arquivo (alguma dica para substituir o WGET?) Gostaria de não depender dele<br>

Falta:<br>
1 - Comentar o código<br>
2 - Corrigir bug que sai do sistema se o audio for muito grande <br>

O que existe de novo<br>
1 - Arquivo de configuração programavel

INICIANDO
=========
Instale EVA com a seguinte linha de comando:

<pre><code>gem install eva-ia-robot</code></pre>

Sintax do arquivo eva.config:
<pre><code>& fechar aplicativo
$ executar módulo
% abrir aplicativo
#[COMANDOS DE VOZ]:[RESPOSTA OU MODULO]=>[ABRIR OU FECHAR PROGRAMA OU EXECUTAR MODULO]
</code></pre>

lista de módulos existentes:
<pre><code>$hora
$versao
$data
$sistema
$evaconfig
$exit
$beepoff
$beepon
$feedbackon
$feedbackoff
$showrecordon
$showrecordoff
$exibir comandos

</code></pre>
config.yml - Exemplo de configuração de variaveis:
<pre><code>
language: pt-br
beep: nao
feedback: nao
showrecord: nao
temporesposta: nao
</code></pre>

eva.config - Exemplo de configuração de comandos:
<pre><code>#[abrir chrome]:[abrindo krome]=>[%chrome.exe]
#[finalizar chrome]:[finalizando krome]=>[&chrome.exe]
#[que horas são]:[$hora]=>[]
#[sistema operacional]:[$sistema]=>[]
#[eva]:[pois não]=>[]
#[versão]:[$versao]=>[]
#[que dia é hoje]:[$data]=>[]
#[abrir excel]:[abrindo ekcel]=>[%excel.exe]
#[finalizar excel]:[finalizando ekcel]=>[&excel.exe]
#[abrir word]:[abrindo word]=>[%winword.exe]
#[finalizar word]:[finalizando word]=>[&winword.exe]
#[abrir illustrator]:[abrindo illustrator]=>[%illustrator.exe]
#[finalizar illustrator]:[finalizando illustrator]=>[&illustrator.exe]
#[abrir prompt]:[abrindo prompt de comando]=>[%cmd.exe]
#[finalizar prompt]:[finalizando prompt]=>[&cmd.exe]
#[sair]:[finalizando sistema de voz]=>[$exit]
</code></pre>
