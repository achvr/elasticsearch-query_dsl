module Elasticsearch
  module QueryDsl
    class HasChildFilter < Filter
      attribute_method :type, :alias => :child_type
      query_container_method :query
      filter_container_method :filter

      def to_hash(params={})
        h = {:type => @type}
        h[:query] = @query.to_hash(params) unless @query.nil? || @query.empty?
        h[:filter] = @filter.to_hash(params) unless @filter.nil? || @filter.empty?
        {:has_child => h}
      end
    end
  end
end
