require_relative 'decay_score_function'

module Elasticsearch
  module QueryDsl
    class ExpDecayScoreFunction < DecayScoreFunction
      protected
      def function_name
        :exp
      end
    end
  end
end
