module Elasticsearch
  module QueryDsl
    class TermsQuery < Query
      attribute_methods :field, :minimum_should_match
      attribute_method :values, :alias => :terms

      def to_hash(params={})
        h = {@field => Array(@values)}
        h[:minimum_should_match] = @minimum_should_match unless @minimum_should_match.nil?
        {:terms => h}
      end
    end
  end
end
