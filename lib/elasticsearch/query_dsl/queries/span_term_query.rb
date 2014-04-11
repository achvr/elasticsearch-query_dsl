module Elasticsearch
  module QueryDsl
    class SpanTermQuery < Query
      attribute_methods :field, :boost
      attribute_method :value, :alias => :term

      def to_hash(params={})
        if @boost.nil?
          h = {@field => @value}
        else
          h = {@field => {:value => @value, :boost => @boost}}
        end
        {:span_term => h}
      end
    end
  end
end
