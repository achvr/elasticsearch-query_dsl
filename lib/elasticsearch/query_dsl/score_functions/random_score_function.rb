module Elasticsearch
  module QueryDsl
    class RandomScoreFunction < ScoreFunction
      attribute_method :seed

      def to_hash(params={})
        {:seed => @seed}
      end
    end
  end
end
