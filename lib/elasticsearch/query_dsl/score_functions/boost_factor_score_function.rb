module Elasticsearch
  module QueryDsl
    class BoostFactorScoreFunction < ScoreFunction
      attribute_method :boost_factor

      def to_hash(params={})
        {:boost_factor => @boost_factor}
      end
    end
  end
end
