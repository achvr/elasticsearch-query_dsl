module Elasticsearch
  module QueryDsl
    class GeohashCellFilter < Filter
      attribute_methods :field, :precision, :neighbors
      attribute_method :cache, :alias => :_cache
      geo_point_container_method :points

      def to_hash(params={})
        h = {@field => @points.to_hash(params)}
        h[:precision] = @precision unless @precision.nil?
        h[:neighbors] = @neighbors unless @neighbors.nil?
        h[:_cache] = @cache unless @cache.nil?
        {:geo_hashcell => h}
      end
    end
  end
end
