module Elasticsearch
  module QueryDsl
    class IdsFilter < Filter
      attribute_methods :type, :values

      def to_hash(params={})
        h = {:values => Array(@values)}
        h[:type] = @type unless @type.nil?
        {:ids => h}
      end
    end
  end
end
