module Elasticsearch
  module QueryDsl
    class ScriptScoreFunction < ScoreFunction
      attribute_methods :lang, :script

      def params(*args, &block)
        @params ||= ScriptParamValues.new
        @params.instance_exec(&block)
        @params
      end

      def to_hash(params={})
        h = {:script => @script}
        h[:lang] = @lang unless @lang.nil?
        h[:params] = @params unless @params.nil?
        {:script_score => h}
      end
    end
  end
end
