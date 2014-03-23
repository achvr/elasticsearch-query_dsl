module Elasticsearch
  module QueryDsl
    class TermsQuery < Query
      def initialize
        @minimum_should_match = nil
      end

      def field(val=nil)
        @field = val unless val.nil?
        @field
      end

      def values(val=nil)
        @values = val unless val.nil?
        @values
      end

      def minimum_should_match(val=nil)
        @minimum_should_match = val unless val.nil?
        @minimum_should_match
      end

      def to_hash(params={})
        h = {@field => Array(values)}
        h['minimum_should_match'] = @minimum_should_match unless @minimum_should_match.nil?
        {'terms' => h}
      end
    end
  end
end
