module Elasticsearch
  module QueryDsl
    class FilteredQuery < Query
      query_container_method :query
      filter_container_method :filter

      def to_hash(params={})
        {
          :filtered => {
            :query => @query.to_hash(params),
            :filter => @filter.to_hash(params)
          }
        }
      end
    end
  end
end
