module Elasticsearch
  module QueryDsl
    class LinearDecayScoreFunction < ScoreFunction
      protected
      def function_name
        :linear
      end
    end
  end
end
