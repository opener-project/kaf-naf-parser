require File.expand_path('../lib/opener/kaf_naf_parser/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'opener-kaf-naf-parser'
  gem.version     = Opener::KafNafParser::VERSION
  gem.authors     = ['ruben.izquierdobevia@vu.nl','development@olery.com']
  gem.summary     = 'Parser to translate KAF to NAF and back.'
  gem.description = gem.summary
  gem.homepage    = "http://github.com/cltl/KafNafParserPy"
  gem.extensions  = ['ext/hack/Rakefile']
  gem.license     = 'Apache 2.0'

  gem.required_ruby_version = '>= 1.9.2'

  gem.files = Dir.glob([
    'core/*',
    'ext/**/*',
    'lib/**/*',
    'config.ru',
    '*.gemspec',
    'LICENSE.txt',
    '*_requirements.txt',
    'README.md',
    'exec/**/*',
    'task/*'
  ]).select { |file| File.file?(file) }

  gem.executables = Dir.glob('bin/*').map { |file| File.basename(file) }

  gem.add_dependency 'opener-daemons', '~> 2.2'
  gem.add_dependency 'opener-webservice', '~> 2.1'
  gem.add_dependency 'opener-core', '~> 2.2'

  gem.add_dependency 'builder'
  gem.add_dependency 'slop', '~> 3.5'

  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
end
