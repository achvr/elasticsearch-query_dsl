module Elasticsearch
  module QueryDsl
    class ScriptScoreFunction < ScoreFunction
      attribute_methods :lang, :script
      script_params_container_method :params

      def to_hash(params={})
        h = {:script => @script}
        h[:lang] = @lang unless @lang.nil?
        h[:params] = @params unless @params.nil?
        {:script_score => h}
      end
    end
  end
end
