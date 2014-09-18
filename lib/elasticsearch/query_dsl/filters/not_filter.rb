module Elasticsearch
  module QueryDsl
    class NotFilter < Filter
      attribute_method :cache, :alias => :_cache
      filter_container_method :filter, :delegate_methods_from_top => true, :delegate_aliases_from_top => true

      def to_hash(params={})
        h = {:filter => @filter.to_hash(params)}
        h[:_cache] = @cache unless @cache.nil?
        {:not => h}
      end
    end
  end
end
