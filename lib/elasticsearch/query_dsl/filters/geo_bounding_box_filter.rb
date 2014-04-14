module Elasticsearch
  module QueryDsl
    class GeoBoundingBoxFilter < Filter
      attribute_methods :field, :type, :cache

      def coordinates(*args, &block)
        @coordinates ||= GeoBoundingBox.new
        @coordinates.instance_exec(&block) unless block.nil?
        @coordinates
      end
      delegate_methods([:top, :left, :bottom, :right, :top_left, :bottom_right], :coordinates)

      def to_hash(params={})
        h = {@field => @coordinates.to_hash(params)}
        h[:type]   = @type unless @type.nil?
        h[:_cache] = @cache unless @cache.nil?
        {:geo_bounding_box => h}
      end
    end
  end
end
