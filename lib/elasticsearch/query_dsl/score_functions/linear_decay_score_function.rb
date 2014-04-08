require_relative 'decay_score_function'

module Elasticsearch
  module QueryDsl
    class LinearDecayScoreFunction < DecayScoreFunction
      protected
      def function_name
        :linear
      end
    end
  end
end
