# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'podspecdolly/version'

Gem::Specification.new do |spec|
  spec.name          = "podspecdolly"
  spec.version       = Podspecdolly::VERSION
  spec.authors       = ["Do Son"]
  spec.email         = ["dodinhthyson@gmail.com"]

  spec.summary       = %q{Cloning required pod to a local podspec}
  spec.description   = %q{Cloning required pod to a local podspec}
  spec.homepage      = "http://doraeminemon.github.io/podspecdolly"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "thor"
  spec.add_dependency "unirest"

end
