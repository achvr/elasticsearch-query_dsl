module Elasticsearch
  module QueryDsl
    class BoostingQuery < Query
      query_container_methods :positive, :negative
      attribute_method :negative_boost

      def to_hash(params={})
        h = {}
        h[:positive]       = @positive.to_hash(params) unless @positive.nil? || @positive.empty?
        h[:negative]       = @negative.to_hash(params) unless @negative.nil? || @negative.empty?
        h[:negative_boost] = @negative_boost unless @negative_boost.nil?
        {:boosting => h}
      end
    end
  end
end
