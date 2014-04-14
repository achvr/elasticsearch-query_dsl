module Elasticsearch
  module QueryDsl
    class TermsLookupFilter < Filter
      attribute_methods :field, :index, :type, :id, :path, :routing, :cache, :cache_key
      alias :_cache_key :cache_key

      def to_hash(params={})
        lookup = {
          :type => @type,
          :path => @path,
          :id => @id
        }
        lookup[:index]   = @index     unless @index.nil?
        lookup[:routing] = @routing   unless @routing.nil?
        lookup[:cache]   = @cache     unless @cache.nil?
        h = {
          @field => lookup
        }
        h[:_cache_key]   = @cache_key unless @cache_key.nil?
        {:terms => h}
      end
    end
  end
end
