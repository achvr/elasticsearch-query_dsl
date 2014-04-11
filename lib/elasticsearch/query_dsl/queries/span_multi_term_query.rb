module Elasticsearch
  module QueryDsl
    class SpanMultiTermQuery < Query
      multi_term_container_method :match

      def to_hash(params={})
        {:span_multi => {:match => @match}}
      end
    end
  end
end
