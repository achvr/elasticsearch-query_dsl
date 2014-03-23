module Elasticsearch
  module QueryDsl
    class DisMaxQuery < Query
      query_container_method :queries

      def tie_breaker(val=nil)
      end

      def boost(val=nil)
      end
    end
  end
end
