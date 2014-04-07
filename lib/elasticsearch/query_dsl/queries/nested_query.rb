module Elasticsearch
  module QueryDsl
    class NestedQuery < Query
      query_container_method :query
      attribute_methods :path, :score_mode

      def to_hash(params={})
        h = {:query => @query.to_hash(params)}
        h[:path] = @path unless @path.nil?
        h[:score_mode] = @score_mode unless @score_mode.nil?
        h
      end
    end
  end
end
