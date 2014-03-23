module Elasticsearch
  module QueryDsl
    class BoostingQuery < Query
      query_container_methods :positive, :negative

      def negative_boost(val=nil)
      end
    end
  end
end
