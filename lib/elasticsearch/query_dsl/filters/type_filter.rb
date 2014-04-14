module Elasticsearch
  module QueryDsl
    class TypeFilter < Filter
      attribute_method :value

      def to_hash(params={})
        {:type => {:value => @value}}
      end
    end
  end
end
