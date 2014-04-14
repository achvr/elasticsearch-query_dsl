module Elasticsearch
  module QueryDsl
    class GeoDistanceFilter < Filter
      attribute_methods :field, :distance, :distance_type, :optimize_bbox
      attribute_method :cache, :alias => :_cache
      geo_point_container_method :geo_point

      def to_hash(params={})
        h = {@field => @geo_point.to_hash(params)}
        h[:distance]      = @distance unless @distance.nil?
        h[:distance_type] = @distance_type unless @distance_type.nil?
        h[:optimize_bbox] = @optimize_bbox unless @optimize_bbox.nil?
        h[:_cache]        = @cache unless @cache.nil?
        {:geo_distance => h}
      end
    end
  end
end
