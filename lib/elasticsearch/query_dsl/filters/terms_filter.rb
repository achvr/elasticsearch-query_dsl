module Elasticsearch
  module QueryDsl
    class TermsFilter < Filter
      def field(val=nil)
        @field = val unless val.nil?
        @field
      end

      def values(val=nil)
        @values = val unless val.nil?
        @values
      end
    end
  end
end
