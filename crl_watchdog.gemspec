# -*- encoding: utf-8 -*-
require File.expand_path('../lib/crl_watchdog', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Carsten Zimmermann"]
  gem.email         = ["cz@aegisnet.de"]
  gem.description   = %q{Checks if an OpenSSL certificate revocation file expires within a given amount of days}
  gem.summary       = %q{Checks if a CRL expires within a given amount of days}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "crl_watchdog"
  gem.require_paths = ["lib"]
  gem.version       = CrlWatchdog::VERSION

  gem.add_development_dependency 'rspec', '>= 3.5'
  gem.add_development_dependency 'activesupport'
end
