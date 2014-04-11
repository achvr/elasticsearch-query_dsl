module Elasticsearch
  module QueryDsl
    class TermQuery < Query
      attribute_methods :field, :boost
      attribute_method :value, :alias => :term

      def to_hash(params={})
        h = {attr_eval(@field, params) => attr_eval(value, params)}
        {:term => h}
      end
    end
  end
end
