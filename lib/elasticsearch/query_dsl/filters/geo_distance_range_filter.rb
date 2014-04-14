module Elasticsearch
  module QueryDsl
    class GeoDistanceRangeFilter < Filter
      attribute_methods :field, :distance, :distance_type, :optimize_bbox
      attribute_methods :lt, :lte, :gt, :gte, :from, :to, :include_upper, :include_lower
      attribute_method :cache, :alias => :_cache
      geo_point_container_method :geo_point

      def to_hash(params={})
        h = {@field => @geo_point.to_hash(params)}
        h[:distance]      = @distance unless @distance.nil?
        h[:distance_type] = @distance_type unless @distance_type.nil?
        h[:optimize_bbox] = @optimize_bbox unless @optimize_bbox.nil?
        h[:lt]            = @lt unless @lt.nil?
        h[:lte]           = @lte unless @lte.nil?
        h[:gt]            = @gt unless @gt.nil?
        h[:gte]           = @gte unless @gte.nil?
        h[:from]          = @from unless @from.nil?
        h[:to]            = @to unless @to.nil?
        h[:include_upper] = @include_upper unless @include_upper.nil?
        h[:include_lower] = @include_lower unless @include_lower.nil?
        h[:_cache]        = @cache unless @cache.nil?
        {:geo_distance_range => h}
      end
    end
  end
end
