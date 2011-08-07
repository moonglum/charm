# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "charm/version"

Gem::Specification.new do |s|
  s.name        = "charm"
  s.version     = Charm::VERSION
  s.authors     = ["moonglum"]
  s.email       = ["moonglum@moonbeamlabs.com"]
  s.homepage    = "http://github.com/moonglum/charm"
  s.summary     = %q{The Rubyist's wrapper around ncurses}
  s.description = %q{A Ruby Wrapper around ncurses that feels like Ruby and not like C without semicolons. This is a fork of the snowleopard-ncurses gem.}
  s.rubyforge_project = "charm"
  s.extensions << "ext/ncurses/extconf.rb"
  s.extra_rdoc_files = %w[README.mdown LICENSE]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
