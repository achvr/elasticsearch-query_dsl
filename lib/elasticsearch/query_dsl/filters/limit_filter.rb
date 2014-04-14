module Elasticsearch
  module QueryDsl
    class LimitFilter < Filter
      attribute_method :value

      def to_hash(params={})
        {:limit => {:value => @value}}
      end
    end
  end
end
