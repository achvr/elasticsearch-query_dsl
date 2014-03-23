module Elasticsearch
  module QueryDsl
    class HasChildQuery < Query
      query_container_method :query

      def type(val=nil)
        @type = val unless val.nil?
        if block_given?
          @type = yield
        end
        @type
      end

      def score_type(val=nil)
        @score_type = val unless val.nil?
        @score_type
      end

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
