module Elasticsearch
  module QueryDsl
    class PrefixQuery < Query
      attribute_methods :field, :value, :boost

      def to_hash(params={})
        if @boost.nil?
          h = {@field => @value}
        else
          h = {@field => {:value => @value, :boost => @boost}}
        end
        {:prefix => h}
      end
    end
  end
end
