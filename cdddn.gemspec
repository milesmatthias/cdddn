$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cdddn/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cdddn"
  s.version     = Cdddn::VERSION
  s.authors     = ["Miles Matthias"]
  s.email       = ["miles.matthias@gmail.com"]
  s.homepage    = "https://github.com/milesmatthias/cdddn"
  s.summary     = "Content Delivery & Device Detection Network (CDDDN) is a rails engine that provides mobile detection functionality for use in CDNs."
  s.description = "Content Delivery & Device Detection Network (CDDDN) is a rails engine that provides mobile detection functionality for use in CDNs, like CloudFront and Akamai. This engine specifically allows you to cache static pages in both desktop and mobile versions for the same domain & url, rather than using an m.example.com approach."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2"

  s.add_development_dependency "sqlite3"
end
