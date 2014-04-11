require_relative 'match_query'

module Elasticsearch
  module QueryDsl
    class MatchPhraseQuery < MatchQuery
      protected

      def get_type
        type || :match_phrase
      end
    end
  end
end
