module Elasticsearch
  module QueryDsl
    class RangeQuery < Query
      attribute_methods :field, :gte, :gt, :lte, :lt, :boost

      def to_hash(params={})
        h = {}
        h[:gte]   = @gte unless @gte.nil?
        h[:gt]    = @gt unless @gt.nil?
        h[:lte]   = @lte unless @lte.nil?
        h[:lt]    = @lt unless @lt.nil?
        h[:boost] = @boost unless @boost.nil?
        {:range => {@field => h}}
      end
    end
  end
end
