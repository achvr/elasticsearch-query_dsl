module Elasticsearch
  module QueryDsl
    class GeoShapeQuery < Query
      attribute_method :field
      geo_shape_container_method :shapes, :delegate_methods_from_top => true, :delegate_aliases_from_top => true

      def to_hash(params={})
        h = {@field => {:shape => @shapes.to_hash(params)}}
        {:geo_shape => h}
      end
    end
  end
end
