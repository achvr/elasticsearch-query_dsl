module Elasticsearch
  module QueryDsl
    class OrFilter < Filter
      attribute_method :cache, :alias => :_cache
      filter_container_method :filter

      def to_hash(params={})
        h = {:filter => @filter.to_hash(params)}
        h[:_cache] = @cache unless @cache.nil?
        {:or => h}
      end
    end
  end
end
