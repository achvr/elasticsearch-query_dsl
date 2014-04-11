module Elasticsearch
  module QueryDsl
    class SpanNotQuery < Query
      span_query_container_methods :include, :exclude

      def to_hash(params={})
        h = {}
        h[:include] = @include.to_hash(params) unless @include.nil? || @include.empty?
        h[:exclude] = @exclude.to_hash(params) unless @exclude.nil? || @exclude.empty?
        {:span_not => h}
      end
    end
  end
end
