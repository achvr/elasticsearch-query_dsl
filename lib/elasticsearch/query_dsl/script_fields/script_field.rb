module Elasticsearch
  module QueryDsl
    class ScriptField < SearchDefComponent
      attribute_methods :field, :script
      script_params_container_method :params

      def to_hash(params={})
        h = {:script => @script}
        h[:params] = @params unless @params.nil?
        {@field => h}
      end
    end
  end
end
