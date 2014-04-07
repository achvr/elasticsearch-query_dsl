module Elasticsearch
  module QueryDsl
    class AndFilter < Filter
      attribute_method :cache
      alias :_cache :cache
      filter_container_method :filters
      delegate *QueryDsl.component_method_names(:filters), :to => :filters
      QueryDsl.each_component_method_alias(:filters) do |method_alias, method_name|
        alias_method method_alias, method_name
      end

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
