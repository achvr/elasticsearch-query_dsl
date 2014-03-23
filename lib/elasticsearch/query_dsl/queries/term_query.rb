module Elasticsearch
  module QueryDsl
    class TermQuery < Query
      attribute_methods :field, :value, :boost

      def to_hash(params={})
        h = {attr_eval(@field, params) => attr_eval(value, params)}
        {'term' => h}
      end
    end
  end
end
