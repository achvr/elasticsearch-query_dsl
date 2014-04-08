require_relative 'decay_score_function'

module Elasticsearch
  module QueryDsl
    class GaussDecayScoreFunction < DecayScoreFunction
      protected
      def function_name
        :gauss
      end
    end
  end
end
