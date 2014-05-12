module Elasticsearch
  module QueryDsl
    class GeoShapeFilter < Filter
      attribute_method :field
      attribute_method :cache, :alias => :_cache
      geo_shape_container_method :shapes, :delegate_methods_from_top => true, :delegate_aliases_from_top => true

      def to_hash(params={})
        h = {@field => {:shape => @shapes.to_hash(params)}}
        h[:_cache] = @cache unless @cache.nil?
        {:geo_shape => h}
      end
    end
  end
end
