module Elasticsearch
  module QueryDsl
    class SpanNearQuery < Query
      span_query_container_method :clauses
      attribute_methods :slop, :in_order, :collect_payloads

      def to_hash(params={})
        h = {:clauses => @clauses.to_hash(params)}
        h[:slop]             = @slop unless @slop.nil?
        h[:in_order]         = @in_order unless @in_order.nil?
        h[:collect_payloads] = @collect_payloads unless @collect_payloads.nil?
        {:span_near => h}
      end
    end
  end
end
