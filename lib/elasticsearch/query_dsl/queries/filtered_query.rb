module Elasticsearch
  module QueryDsl
    class FilteredQuery < Query
      query_container_method :query
      filter_container_method :filter

      def to_hash(params={})
        {
          :filtered => {
            :query => (@query.nil? || @query.empty?) ? MatchAllQuery.new.to_hash : @query.to_hash(params),
            :filter => (@filter.nil? || @filter.empty?) ? MatchAllFilter.new.to_hash : @filter.to_hash(params),
          }
        }
      end
    end
  end
end
