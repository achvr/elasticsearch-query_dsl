module Elasticsearch
  module QueryDsl
    class BoolQuery < Query
      query_container_method :must, :must_not, :should

      def minimum_should_match
      end

      def boost
      end

      def to_hash(params={})
        h = {}
        h[:must]     = @must.to_hash(params) unless @must.nil? || @must.empty?
        h[:must_not] = @must_not.to_hash(params) unless @must_not.nil? || @must_not.empty?
        h[:should]   = @should.to_hash(params) unless @should.nil? || @should.empty?
        {:bool => h}
      end
    end
  end
end
