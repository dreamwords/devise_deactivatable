# -*- encoding: utf-8 -*-
$:.unshift File.expand_path('../lib', __FILE__)
require 'devise_deactivatable/version'

Gem::Specification.new do |s|
  s.name         = "devise_deactivatable"
  s.version      = DeviseDeactivatable::VERSION
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Elan Meng"]
  s.email        = ["dreamwords@gmail.com"]
  s.homepage     = "https://github.com/dreamwords/devise_deactivatable"
  s.summary      = "Deactivate support for Devise"
  s.description  = "Deactivate support for Devise."
  s.license      = 'MIT'
  
  s.files        = `git ls-files {app,config,lib}`.split("\n") + %w[LICENSE README.md]
  s.require_path = "lib"
  
  s.add_runtime_dependency('devise', '>= 3.0.0')
end