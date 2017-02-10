$:.push File.expand_path("../lib", __FILE__)
require "peddler-parsers/version"

Gem::Specification.new do |gem|
  gem.name        = "peddler-parsers"
  gem.version     = PeddlerParsers::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ["Blayne Puklich"]
  gem.email       = ["blayne@puklich.com"]
  gem.homepage    = "http://github.com/bpuklich/peddler-parsers"
  gem.summary     = %q{Wraps the Amazon MWS APIs in delicious Ruby goodness}
  gem.description = %q{A rich Ruby interface to the Amazon MWS APIs}
  gem.license     = 'MIT'

  gem.files         = Dir.glob("lib/**/*") + %w(LICENSE README.md)
  gem.test_files    = Dir.glob("test/**/*")
  gem.require_paths = ["lib"]

  gem.add_dependency "money", "~> 6.0"
  gem.add_dependency "nokogiri", "~> 1.5"
  gem.add_dependency "peddler", ">= 0.13.0"
  gem.add_dependency "structure", "~> 1.0.0"
  gem.required_ruby_version = ">= 1.9"
end
