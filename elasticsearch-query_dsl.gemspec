# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'elasticsearch/query_dsl/version'

Gem::Specification.new do |s|
  s.name        = 'elasticsearch-query_dsl'
  s.version     = Elasticsearch::QueryDsl::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['kohder']
  s.email       = ['rob@achvrs.com']
  s.homepage    = 'http://github.com/achvr/elasticsearch-query_dsl'
  s.summary     = 'Elasticsearch Query Language DSL for Ruby'
  s.description = 'Elasticsearch Query Language DSL for Ruby'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.rdoc_options     = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md']

  s.add_dependency 'multi_json', '>= 1.2'

  s.add_development_dependency 'bundler', '>= 1.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'json_spec', '~> 1.1'
end
