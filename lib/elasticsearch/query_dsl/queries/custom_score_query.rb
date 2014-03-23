module Elasticsearch
  module QueryDsl
    class CustomScoreQuery < Query
      query_container_methods :query

      def script(val=nil)
        @script = val unless val.nil?
        @script
      end

      def to_hash(params={})
        {
          :custom_score => {
            :query => @query.to_hash(params),
            :script => @script
          }
        }
      end
    end
  end
end
