module Elasticsearch
  module QueryDsl
    class GaussDecayScoreFunction < ScoreFunction
      protected
      def function_name
        :gauss
      end
    end
  end
end
