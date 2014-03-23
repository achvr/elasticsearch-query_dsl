module Elasticsearch
  module QueryDsl
    class ConstantScoreQuery < Query
      query_container_method :query
      filter_container_method :filter

      def boost(val=nil)
      end
    end
  end
end
