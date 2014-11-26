require 'opener/webservice'

module Opener
  class KafNafParser
    ##
    # Polarity tagger server powered by Sinatra.
    #
    class Server < Webservice::Server
      set :views, File.expand_path('../views', __FILE__)

      self.text_processor  = KafNafParser
      self.accepted_params = [:conversion]
    end # Server
  end # KafNafParser
end # Opener
