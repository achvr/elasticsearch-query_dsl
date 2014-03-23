module Elasticsearch
  module QueryDsl
    class SearchDef < SearchDefComponent
      def self.search(index_or_indexes, &block)
        Elasticsearch::QueryDsl::SearchDef.new(index_or_indexes, block)
      end

      query_container_method :query
      # include SearchDefComponents
      # component_methods :query
      filter_container_method :post_filter

      def search_def
        self
      end

      def initialize(index_or_indexes, block=nil)
        @index_or_indexes = index_or_indexes
        @components = {}
        @size = 10
        @from = 0
        @search_def = self
        super(:search_def => self)
        instance_exec(:search_def => self, &block)
      end

      def register_component(id, component)
        puts "Registering Component: id=#{id}, component=#{component}"
        @components[id] = component
      end

      def component(id)
        @components[id]
      end

      def facets(*args, &block)
      end

      def fields(*args, &block)
      end

      def script_fields(&block)
        @script_fields ||= ScriptFields.new(self)
        @script_fields.instance_exec(&block)
      end

      def sort(&block)
      end

      def size(val=nil)
        @size = val unless val.nil?
        @size
      end

      def from(val=nil)
        @from = val unless val.nil?
        @from
      end

      def to_hash(params={})
        {
          :query => @query.to_hash(params),
          :post_filter => @post_filter.to_hash(params),
          :facets => nil,
          :fields => nil,
          :script_fields => nil,
          :sort => nil,
          :size => size,
          :from => from
        }
      end
    end

    class ScriptFields
      def initialize(search_def)
        @search_def = search_def
      end

      def distance(*args)
        puts "HERE in distance"
      end
    end
  end
end
