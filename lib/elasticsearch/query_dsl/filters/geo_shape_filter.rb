module Elasticsearch
  module QueryDsl
    class GeoShapeFilter < Filter
      attr_accessor :coordinates, :type
      def initialize(coordinates, type)
        @coordinates = coordinates
        @type = type
      end
    end
  end
end
