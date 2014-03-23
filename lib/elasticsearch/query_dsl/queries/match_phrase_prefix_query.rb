require_relative 'match_phrase_query'

module Elasticsearch
  module QueryDsl
    class MatchPhrasePrefixQuery < MatchPhraseQuery
      def max_expansions
      end
    end
  end
end
