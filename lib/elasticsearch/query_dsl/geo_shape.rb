module Elasticsearch
  module QueryDsl
    class GeoShape < SearchDefComponent
      class Point < GeoShape
        def type; 'point'; end
      end
      class LineString < GeoShape
        def type; 'linestring'; end
      end
      class Polygon < GeoShape
        def type; 'polygon'; end
      end
      class MultiPoint < GeoShape
        def type; 'multipoint'; end
      end
      class MultiLineString < GeoShape
        def type; 'multilinestring'; end
      end
      class MultiPolygon < GeoShape
        def type; 'multipolygon'; end
      end
      class Envelope < GeoShape
        def type; 'envelope'; end
      end
      class Circle < GeoShape
        def type; 'circle'; end
      end

      attribute_methods :type, :coordinates, :radius

      def to_hash(params={})
        {
          :type => type,
          :coordinates => Array(@coordinates)
        }
      end
    end
  end
end
