module Elasticsearch
  module QueryDsl
    class HasChildQuery < Query
      query_container_method :query
      attribute_method :type, :alias => :child_type
      attribute_method :score_type

      def to_hash(params={})
        h = {}
        h[:type] = @type unless @type.nil?
        unless @score_type.nil?
          h[:score_type] = @score_type.is_a?(Proc) ? @score_type.call : @score_type
        end
        h[:query] = @query.to_hash(params) unless @query.nil?
        {:has_child => h}
      end
    end
  end
end
