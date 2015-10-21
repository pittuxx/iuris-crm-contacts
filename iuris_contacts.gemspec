$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "iuris/contacts/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "iuris_contacts"
  s.version     = Iuris::Contacts::VERSION
  s.authors     = ["pittuxx"]
  s.email       = ["pittuxx@gmail.com"]
  s.homepage    = "https://github.com/pittuxx"
  s.summary     = "Contacts feature for Iuris::Contacts."
  s.description = "Contacts feature for Iuris::Contacts."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "iuris_core"
  s.add_dependency "deface"

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "faker"
  s.add_development_dependency "database_cleaner"

end
