module Elasticsearch
  module QueryDsl
    class ScriptField < SearchDefComponent
      attribute_methods :field, :script

      def params(*args, &block)
        @params ||= ScriptParamValues.new
        @params.instance_exec(&block)
        @params
      end

      def to_hash(params={})
        h = {:script => @script}
        h[:params] = @params unless @params.nil?
        {@field => h}
      end
    end
  end
end
