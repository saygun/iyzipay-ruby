Gem::Specification.new do |s|
  s.name        = 'iyzipay'
  s.version     = GVB.version
  s.date        = GVB.date
  s.required_ruby_version = '>= 2.1.6'
  s.summary     = 'iyzipay api ruby client'
  s.description = 'iyzipay api ruby client. You can sign up for an iyzico account at https://iyzico.com'
  s.authors     = ['Iyzico']
  s.email       = 'iyzico-ci@iyzico.com'
  s.files       = `git ls-files`.split('\n')
  s.test_files  = `git ls-files -- spec/*`.split('\n')
  s.homepage    = 'http://rubygems.org/gems/iyzipay'
  s.license     = 'MIT'

  s.add_runtime_dependency('rest-client', '>= 1.8.0')
  s.add_development_dependency('rspec', '>= 3.3.0')
  s.add_development_dependency('rspec-rails', '>= 3.3.0')
  s.add_dependency('git-version-bump', '~> 0.15.1')

  s.require_paths = ['lib']
end