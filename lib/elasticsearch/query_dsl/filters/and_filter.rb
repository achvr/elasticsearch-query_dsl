module Elasticsearch
  module QueryDsl
    class AndFilter < Filter
      attribute_methods :cache
      alias :_cache :cache
      filter_container_method :filters

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

