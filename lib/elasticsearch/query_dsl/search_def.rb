module Elasticsearch
  module QueryDsl
    class SearchDef < SearchDefComponent
      def self.search(index_or_indexes, &block)
        Elasticsearch::QueryDsl::SearchDef.new(index_or_indexes, block)
      end

      attribute_methods :fields, :size, :from, :min_score, :timeout
      query_container_method :query
      filter_container_method :post_filter
      sort_container_method :sort, :delegate_methods_from_top => true
      script_field_container_method :script_fields, :delegate_methods_from_top => true

      def search_def
        self
      end

      def initialize(index_or_indexes, block=nil)
        @index_or_indexes = index_or_indexes
        @components = {}
        @search_def = self
        super(:search_def => self)
        instance_exec(:search_def => self, &block)
      end

      def register_component(component_id, component)
        @components[component_id.to_s] = component
      end

      def has_component?(component_id)
        @components.key?(component_id.to_s)
      end

      def component(component_id)
        comp = @components[component_id.to_s]
        if comp.nil?
          raise ComponentNotFoundError, "Could not find search definition component with id \"#{component_id.to_s}\""
        end
        comp
      end

      def update_component(component_id, &block)
        component(component_id).update(&block)
      end

      def facets(*args, &block)
      end

      def to_hash(params={})
        h = {:query => @query.to_hash(params)}
        h[:post_filter]   = @post_filter.to_hash(params) unless @post_filter.nil?
        h[:facets]        = @facets.to_hash(params) unless @facets.nil?
        h[:fields]        = Array(@fields) unless @fields.nil?
        h[:script_fields] = @script_fields.to_hash(params) unless @script_fields.nil?
        h[:sort]          = @sort.to_hash(params) unless @sort.nil?
        h[:min_score]     = @min_score unless @min_score.nil?
        h[:size]          = @size unless @size.nil?
        h[:from]          = @from unless @from.nil?
        h
      end
    end
  end
end
