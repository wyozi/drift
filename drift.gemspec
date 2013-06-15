$:.push File.expand_path("../lib", __FILE__)

require "drift/version"

Gem::Specification.new do |s|
  s.name        = "drift"
  s.version     = Drift::VERSION
  s.authors     = ["Jim Pruetting"]
  s.email       = ["jim@roboticmethod.com}"]
  s.homepage    = "https://github.com/jpruetting/drift"
  s.summary     = "Blogging engine for Rails."
  s.description = "Drift is a static blogging engine for Rails."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 3.2.0'
  s.add_dependency 'github-markup', '~> 0.7.5'
  s.add_dependency 'redcarpet', '~> 2.2.0'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
end
