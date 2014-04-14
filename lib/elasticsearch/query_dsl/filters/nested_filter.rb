module Elasticsearch
  module QueryDsl
    class NestedFilter < Filter
      attribute_methods :path, :join
      attribute_method :cache, :alias => :_cache
      filter_container_method :filter

      def to_hash(params={})
        h = {:path => @path}
        h[:filter] = @filter.to_hash(params) unless @filter.nil? || @filter.empty?
        h[:join]   = @join unless @join.nil?
        h[:_cache] = @cache unless @cache.nil?
        {:nested => h}
      end
    end
  end
end
