$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "effective_pages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "effective_pages"
  s.version     = EffectivePages::VERSION
  s.authors     = ["Matt Riemer"]
  s.email       = ["matthew@agilestyle.com"]
  s.homepage    = "http://www.agilestyle.com"
  s.summary     = "Summary of EffectivePages."
  s.description = "Description of EffectivePages."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails"
  s.add_dependency "effective_mercury"
  s.add_dependency "effective_slugs"
  s.add_dependency "coffee-rails"
  s.add_dependency "formtastic"
  s.add_dependency "haml"
  s.add_dependency "psych"
  s.add_dependency "migrant"

  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-livereload"
  s.add_development_dependency "poltergeist"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "sqlite3"
end
