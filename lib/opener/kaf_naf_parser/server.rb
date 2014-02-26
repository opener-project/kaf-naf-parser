require 'sinatra/base'
require 'httpclient'
require 'opener/webservice'

module Opener
  class KafNafParser
    ##
    # Polarity tagger server powered by Sinatra.
    #
    class Server < Webservice
      set :views, File.expand_path('../views', __FILE__)
      text_processor KafNafParser
      accepted_params :input
    end # Server
  end # KafNafParser
end # Opener
