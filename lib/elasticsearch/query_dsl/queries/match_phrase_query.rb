require_relative 'match_query'

module Elasticsearch
  module QueryDsl
    class MatchPhraseQuery < MatchQuery
      def analyzer
      end
    end
  end
end
