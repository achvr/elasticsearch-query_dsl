require_relative 'match_phrase_query'

module Elasticsearch
  module QueryDsl
    class MatchPhrasePrefixQuery < MatchPhraseQuery
      protected

      def get_type
        type || :match_phrase_prefix
      end
    end
  end
end
