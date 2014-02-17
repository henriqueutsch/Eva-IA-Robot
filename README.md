Eva-IA-Robot
============

Voice command  your computer<br>

1 - Integração com Google Translate para obter o audio - http://translate.google.com/<br>
2 - Integração com Google Speech para obter o texto da fala - https://www.google.com/intl/pt/chrome/demos/speech.html<br>
3 - Sox para Play e Rec - http://sox.sourceforge.net/<br>
4 - Wget para enviar o arquivo (alguma dica para substituir o WGET?) Gostaria de não depender dele<br>

Falta:<br>
1 - Comentar o código<br>
2 - Corrigir bug que sai do sistema se o audio for muito grande <br>

O que existe de novo<br>
1 - Beep para ouvir o momento de falar o comando
2 - Ativar e desativar o beep e a resposta
3 - Bug corrigido de conversão de texto para utf-8
4 - Comandos para sair, abrir e fechar programas

Iniciando

Instale EVA com a seguinte linha de comando:

<pre><code>gem install eva-ia-robot</code></pre>

Lista de comandos
<pre><code>
<li>Sair - Fecha o sistema</li>
<li>Eva - Chama o sistema pelo nome</li>
<li>Versão - Verifica se existe versão mais atual de EVA</li>
<li>Desativar - Desativa sistema de resposta de comando errado</li>
<li>Ativar - Ativa sistema de resposta de comando errado</li>
<li>Desativar som - Desativa beep para indicar quando dar o comando</li>
<li>Ativar som - Desativa beep para indicar quando dar o comando</li>
<li>Que horas são - Retorna a hora atual no formato [Hora - Minuto]</li>
<li>Que dia é hoje - Retorna o dia atual no formato [Dia da semana - Dia do mês - Nome do mês - ano]</li>
<li>Abrir Word - Abre Microsoft Word</li>
<li>Finalizar Word - Fecha Microsoft Word</li>
<li>Abrir Excel - Abre Microsoft Excel</li>
<li>Finalizar Excel - Fecha Microsoft Excel</li>
<li>Abrir Illustrator - Abre Adobe Illustrator</li>
<li>Finalizar Illustrator - Fecha Adobe Illustrator</li>
<li>Abrir Prompt - Abre prompt de comando</li>
<li>Finalizar Prompt - Fecha prompt de comando</li>
<li>Sistema operacional - Retorna qual sistema operacional esta utilizando</li>
<li>Listar - Lista musicas no diretório D:/musicas</li>
<li>Tocar - Ainda falta tocar a música escolhida</li>

</code></pre>
