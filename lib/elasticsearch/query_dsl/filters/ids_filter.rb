module Elasticsearch
  module QueryDsl
    class IdsFilter < Filter
      attr_accessor :values, :type
      def initialize(values, type=nil)
        @values = values
        @type = type
      end
    end
  end
end
