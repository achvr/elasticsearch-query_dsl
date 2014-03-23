module Elasticsearch
  module QueryDsl
    class HasParentQuery < Query
      query_container_method :query

      def parent_type
      end

      def score_type
      end
    end
  end
end
