module Elasticsearch
  module QueryDsl
    class RangeFilter < Filter
      attribute_methods :field, :gte, :gt, :lte, :lt
      attribute_method :cache, :alias => :_cache

      def to_hash(params={})
        h = {}
        h[:gte]    = @gte unless @gte.nil?
        h[:gt]     = @gt unless @gt.nil?
        h[:lte]    = @lte unless @lte.nil?
        h[:lt]     = @lt unless @lt.nil?
        h[:_cache] = @cache unless @cache.nil?
        {:range => {@field => h}}
      end
    end
  end
end
