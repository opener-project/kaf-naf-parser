require File.expand_path('../lib/opener/kaf_naf_parser/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name                  = 'kaf-naf-parser'
  gem.version               = Opener::KafNafParser::VERSION
  gem.authors               = ['ruben.izquierdobevia@vu.nl','development@olery.com']
  gem.summary               = 'Parser to translate KAF to NAF and back.'
  gem.description           = gem.summary
  gem.homepage              = "http://github.com/cltl/KafNafParserPy"
  gem.required_ruby_version = '>= 1.9.2'

  gem.files       = (`git ls-files`.split("\n")).sort
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files  = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency 'builder'
  gem.add_dependency 'sinatra', '~>1.4.2'
  gem.add_dependency 'httpclient'
  gem.add_dependency 'opener-build-tools'
  gem.add_dependency 'uuidtools'
  gem.add_dependency 'opener-webservice'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
end
