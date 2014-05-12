module Elasticsearch
  module QueryDsl
    class GeoDistanceSort < Sort
      attribute_methods :field, :coordinates, :order, :unit
      attribute_method :sort_mode, :alias => :mode

      def to_hash(params={})
        h = {@field => @coordinates}
        h[:order]     = @order unless @order.nil?
        h[:unit]      = @unit unless @unit.nil?
        h[:sort_mode] = @sort_mode unless @sort_mode.nil?
        {:_geo_distance => h}
      end
    end
  end
end
