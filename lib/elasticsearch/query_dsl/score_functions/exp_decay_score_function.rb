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
