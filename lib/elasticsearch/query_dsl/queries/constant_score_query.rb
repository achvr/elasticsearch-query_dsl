module Elasticsearch
  module QueryDsl
    class ConstantScoreQuery < Query
      query_container_method :query
      filter_container_method :filter
      attribute_method :boost

      def to_hash(params={})
        h = {}
        h[:query]  = @query unless @query.nil? || @query.empty?
        h[:filter] = @filter unless @filter.nil? || @filter.empty?
        h[:boost]  = @boost unless @boost.nil?
        {:constant_score => h}
      end
    end
  end
end
