module Elasticsearch
  module QueryDsl
    class PrefixFilter < Filter
      attribute_methods :field, :value
      attribute_method :cache, :alias => :_cache

      def to_hash(params={})
        if @cache.nil?
          h = {@field => @value}
        else
          h = {@field => {:value => @value, :_cache => @cache}}
        end
        {:prefix => h}
      end
    end
  end
end
