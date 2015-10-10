# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "paperclip-s3/version"

Gem::Specification.new do |s|
  s.name        = "paperclip-s3"
  s.version     = Paperclip::S3::VERSION
  s.authors     = ["Nicolás Hock Isaza"]
  s.email       = ["nhocki@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Simple gem that makes paperclip save the attachments on Amazon S3 for a production Rails application.}
  s.description = %q{The gem will simply extend the has_attached_file to make it store on Amazon S3 when the application is on production. Great for Heroku applications.}

  s.rubyforge_project = "paperclip-s3"

  s.add_dependency('paperclip', '~> 4.3')
  s.add_dependency('aws-sdk', '~> 1.2.5')

  s.add_development_dependency('rake', '~> 0.9.2')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
