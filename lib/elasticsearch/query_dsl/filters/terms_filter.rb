module Elasticsearch
  module QueryDsl
    class TermsFilter < Filter
      attribute_methods :field, :values, :execution
      attribute_method :cache, :alias => :_cache

      def to_hash(params={})
        h = {@field => Array(values)}
        h[:execution] = @execution unless @execution.nil?
        h[:_cache] = @cache unless @cache.nil?
        {:terms => h}
      end
    end
  end
end
