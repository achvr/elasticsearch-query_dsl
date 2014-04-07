module Elasticsearch
  module QueryDsl
    class MatchAllFilter < Filter
      def to_hash(params=nil)
        {:match_all => {}}
      end
    end
  end
end
