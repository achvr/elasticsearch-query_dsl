module Elasticsearch
  module QueryDsl
    class TermFilter < Filter
      attribute_methods :field, :value

      def to_hash(params={})
        h = {@field => value}
        {'term' => h}
      end
    end
  end
end
