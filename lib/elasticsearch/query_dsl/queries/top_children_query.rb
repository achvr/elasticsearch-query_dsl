module Elasticsearch
  module QueryDsl
    class TopChildrenQuery < Query
      query_container_method :query

      def type(val=nil)
      end

      def score(val=nil)
      end

      def factor(val=nil)
      end

      def incremental_factor(val=nil)
      end
    end
  end
end
