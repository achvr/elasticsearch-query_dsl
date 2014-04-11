module Elasticsearch
  module QueryDsl
    class WildcardQuery < Query
      attribute_methods :field, :boost
      attribute_method :value, :alias => :wildcard

      def to_hash(params={})
        if @boost.nil?
          h = {@field => @value}
        else
          h = {@field => {:value => @value, :boost => @boost}}
        end
        {:wildcard => h}
      end
    end
  end
end
