module Elasticsearch
  module QueryDsl
    class HasParentFilter < Filter
      attribute_method :parent_type, :alias => :type
      query_container_method :query
      filter_container_method :filter

      def to_hash(params={})
        h = {:parent_type => @parent_type}
        h[:query] = @query.to_hash(params) unless @query.nil? || @query.empty?
        h[:filter] = @filter.to_hash(params) unless @filter.nil? || @filter.empty?
        {:has_parent => h}
      end
    end
  end
end
