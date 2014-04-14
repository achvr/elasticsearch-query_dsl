module Elasticsearch
  module QueryDsl
    class ScriptSort < Sort
      attribute_methods :script, :type, :order
      script_params_container_method :params

      def to_hash(params={})
        h = {}
        h[:script] = @script unless @script.nil?
        h[:type]   = @type unless @type.nil?
        h[:order]  = @order unless @order.nil?
        h[:params] = @params unless @params.nil?
        {:_script => h}
      end
    end
  end
end
