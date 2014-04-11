module Elasticsearch
  module QueryDsl
    class SpanOrQuery < Query
      span_query_container_method :clauses

      def to_hash(params={})
        {:span_or => {:clauses => @clauses.to_hash(params)}}
      end
    end
  end
end
