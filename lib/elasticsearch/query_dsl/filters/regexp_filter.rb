module Elasticsearch
  module QueryDsl
    class RegexpFilter < Filter
      attribute_methods :field, :value, :flags
      attribute_method :name, :alias => :_name
      attribute_method :cache, :alias => :_cache
      attribute_method :cache_key, :alias => :_cache_key

      def to_hash(params={})
        if @flags.nil?
          h = @value
        else
          h = {:value => @value}
          h[:flags] = @flags unless @flags.nil?
          h[:_cache] = @cache unless @cache.nil?
          h[:_cache_key] = @cache_key unless @cache_key.nil?
        end
        {:regexp => {@field => h}}
      end
    end
  end
end
