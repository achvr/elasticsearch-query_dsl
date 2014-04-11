module Elasticsearch
  module QueryDsl
    class HasParentQuery < Query
      query_container_method :query
      attribute_method :parent_type, :alias => :type
      attribute_method :score_type

      def to_hash(params={})
        h = {}
        h[:parent_type] = @parent_type unless @parent_type.nil?
        h[:score_type] = @score_type unless @score_type.nil?
        h[:query] = @query.to_hash(params) unless @query.nil?
        {:has_parent => h}
      end
    end
  end
end
