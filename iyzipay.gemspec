Gem::Specification.new do |s|
  s.name        = 'iyzipay'
  s.version     = '1.0.0'
  s.required_ruby_version = '>= 2.1.6'
  s.summary     = "iyzipay api ruby client"
  s.description = "iyzipay api ruby client"
  s.authors     = ["Iyzico"]
  s.email       = 'iyzico-ci@iyzico.com'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- spec/*`.split("\n")
  s.homepage    = 'http://rubygems.org/gems/iyzipay'
  s.license     = 'MIT'

  s.add_dependency('rest-client', '~> 1.8.0')
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"

  s.require_paths = ['lib']
end