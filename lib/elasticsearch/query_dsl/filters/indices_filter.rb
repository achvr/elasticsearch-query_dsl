module Elasticsearch
  module QueryDsl
    class IndicesFilter < Filter
      query_container_method :query

      def indices(val=nil)
      end

      def no_match_query(val=nil)
      end
    end
  end
end
