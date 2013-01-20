# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "cap_crontab"
  gem.version       = File.read("VERSION")
  gem.authors       = ["Conor Hunt", "Scott Taylor"]
  gem.email         = ["scott@railsnewbie.com"]
  gem.description   = %q{Install a crontab through cap}
  gem.summary       = <<-HERE
Capistrano recipe for installing crontabs from the config/crontabs
directory in your application. Extremely simple, but flexible. Crontab files
are evaluated as ERB templates and have access to all capistrano variables.
HERE
  gem.homepage      = "http://github.com/smtlaissezfaire/cap_crontab"
  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end
