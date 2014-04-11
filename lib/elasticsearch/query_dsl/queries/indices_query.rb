module Elasticsearch
  module QueryDsl
    class IndicesQuery < Query
      attribute_method :indices, :alias => :index
      query_container_methods :query, :no_match_query

      def to_hash(params={})
        h = {:indices => Array(@indices)}
        h[:query]          = @query.to_hash(params)
        h[:no_match_query] = @no_match_query unless @no_match_query.nil? || @no_match_query.empty?
        {:indices => h}
      end
    end
  end
end
