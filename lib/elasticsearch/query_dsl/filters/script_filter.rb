module Elasticsearch
  module QueryDsl
    class ScriptFilter < Filter
      attribute_methods :script
      attribute_method :cache, :alias => :_cache
      script_params_container_method :params

      def to_hash(params={})
        h = {:script => @script}
        h[:params] = @params unless @params.nil?
        h[:_cache] = @cache unless @cache.nil?
        {:script => h}
      end
    end
  end
end
