module Elasticsearch
  module QueryDsl
    class GeoShapeFilter < Filter
      attribute_method :field
      attribute_method :cache, :alias => :_cache
      geo_shape_container_method :shape

      def to_hash(params={})
        h = {@field => {:shape => @shape.to_hash(params)}}
        h[:_cache] = @cache unless @cache.nil?
        {:geo_shape => h}
      end
    end
  end
end
