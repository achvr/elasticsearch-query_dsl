module Elasticsearch
  module QueryDsl
    class NestedQuery < Query
      query_container_method :query

      def path(val=nil)
      end

      def score_more(val=nil)
      end
    end
  end
end
