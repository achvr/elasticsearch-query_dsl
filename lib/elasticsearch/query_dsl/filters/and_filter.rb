module Elasticsearch
  module QueryDsl
    class AndFilter < Filter
      attribute_method :cache, :alias => :_cache
      filter_container_method :filters, :delegate_methods_from_top => true, :delegate_aliases_from_top => true

      def to_hash(params={})
        filters = (@filters.nil? || @filters.empty?) ? [] : @filters.to_hash(params)
        if cache
          inner = {:filters => filters, :_cache => true}
        else
          inner = filters
        end
        {:and => inner}
      end
    end
  end
end
