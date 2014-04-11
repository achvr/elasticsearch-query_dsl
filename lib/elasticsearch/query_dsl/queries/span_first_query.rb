module Elasticsearch
  module QueryDsl
    class SpanFirstQuery < Query
      span_query_container_method :match
      attribute_method :end

      def to_hash(params={})
        h = {:match => @match.to_hash(params)}
        h[:end] = @end unless @end.nil?
        {:span_first => h}
      end
    end
  end
end
