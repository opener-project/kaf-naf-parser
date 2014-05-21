require File.expand_path('../lib/opener/kaf_naf_parser/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name                  = 'opener-kaf-naf-parser'
  gem.version               = Opener::KafNafParser::VERSION
  gem.authors               = ['ruben.izquierdobevia@vu.nl','development@olery.com']
  gem.summary               = 'Parser to translate KAF to NAF and back.'
  gem.description           = gem.summary
  gem.homepage              = "http://github.com/cltl/KafNafParserPy"
  gem.required_ruby_version = '>= 1.9.2'
  gem.extensions  = ['ext/hack/Rakefile']

  gem.files = Dir.glob([
    'core/packages/**/*',
    'core/site-packages/pre_build/**/*',
    'core/*.py',
    'ext/**/*',
    'lib/**/*',
    'config.ru',
    '*.gemspec',
    'LICENSE',
    '*_requirements.txt',
    'README.md'
  ]).select { |file| File.file?(file) }

  gem.executables = Dir.glob('bin/*').map { |file| File.basename(file) }

  gem.add_dependency 'builder'
  gem.add_dependency 'sinatra', '~>1.4.3'
  gem.add_dependency 'httpclient'
  gem.add_dependency 'opener-build-tools'
  gem.add_dependency 'uuidtools'
  gem.add_dependency 'opener-webservice'
  gem.add_dependency 'puma'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
end
