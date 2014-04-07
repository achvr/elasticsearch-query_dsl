module Elasticsearch
  module QueryDsl
    class CustomScoreQuery < Query
      query_container_method :query

      def script(val=nil)
        @script = val unless val.nil?
        @script
      end

      def to_hash(params={})
        {
          :custom_score => {
            :query => (@query.nil? || @query.empty?) ? MatchAllQuery.new.to_hash : @query.to_hash(params),
            :script => @script
          }
        }
      end
    end
  end
end
