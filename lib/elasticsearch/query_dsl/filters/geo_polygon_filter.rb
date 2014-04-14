module Elasticsearch
  module QueryDsl
    class GeoPolygonFilter < Filter
      attribute_method :field
      attribute_method :cache, :alias => :_cache
      geo_point_container_method :points

      def to_hash(params={})
        h = {@field => {:points => @points.to_hash(params)}}
        h[:_cache] = @cache unless @cache.nil?
        {:geo_polygon => h}
      end
    end
  end
end
