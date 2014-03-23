module Elasticsearch
  module QueryDsl
    autoload :Logger, 'elasticsearch/query_dsl/logger'
  end
end

require 'elasticsearch/query_dsl/version'
require 'elasticsearch/query_dsl/search_def_components.rb'
require 'elasticsearch/query_dsl/search_def_component.rb'
require 'elasticsearch/query_dsl/search_def.rb'
require 'elasticsearch/query_dsl/filter.rb'
require 'elasticsearch/query_dsl/query.rb'
Dir[File.join(File.dirname(__FILE__), 'query_dsl', 'filters', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'query_dsl', 'queries', '*.rb')].each {|file| require file }
require 'multi_json'
