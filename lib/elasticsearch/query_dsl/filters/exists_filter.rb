module Elasticsearch
  module QueryDsl
    class ExistsFilter < Filter
      attribute_methods :field, :value

      def to_hash(params={})
        {:exists => {@field => @value}}
      end
    end
  end
end
