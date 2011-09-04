# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rake/hooks/version"

Gem::Specification.new do |s|
  s.name        = "rake-hooks"
  s.version     = Rake::Hooks::VERSION
  s.email       = ["guillermo@cientifico.net"]
  s.authors     = ["Guillermo Álvarez"]
  s.description = "Add after and before hooks to rake tasks. You can use \"after :task do ... end\" and \"before :task do ... end\"."
  s.summary     = "Add after and before hooks to rake tasks"

  s.rubyforge_project = "rake-hooks"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "rake", "0.9.2"

  s.add_development_dependency "bundler"
end


