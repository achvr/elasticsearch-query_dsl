module Elasticsearch
  module QueryDsl
    class IdsQuery < Query
      attribute_methods :type, :values

      def to_hash(params={})
        h = {:values => Array(@values)}
        h[:type] = @type unless @type.nil?
        {:ids => h}
      end
    end
  end
end
