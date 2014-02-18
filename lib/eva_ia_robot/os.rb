 # encoding: utf-8
 # verifica o sistema operacional e retorna o nome do sistema em formato texto
require 'rbconfig'

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

  p os()