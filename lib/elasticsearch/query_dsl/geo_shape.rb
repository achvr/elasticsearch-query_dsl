module Elasticsearch
  module QueryDsl
    class GeoShape < SearchDefComponent
      attribute_methods :type, :coordinates

      def to_hash(params={})
        {
          :type => @type,
          :coordinates => Array(@coordinates)
        }
      end
    end
  end
end
