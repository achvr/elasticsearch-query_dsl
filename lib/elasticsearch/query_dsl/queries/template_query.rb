module Elasticsearch
  module QueryDsl
    class TemplateQuery < Query
      attribute_method :query

      def params(*args, &block)
        @params ||= ScriptParamValues.new
        @params.instance_exec(&block)
        @params
      end

      def to_hash(params={})
        h = {:query => @query}
        h[:params] = @params unless @params.nil? || @params.empty?
        {:template => h}
      end
    end
  end
end
