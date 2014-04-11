module Elasticsearch
  module QueryDsl
    class MoreLikeThisQuery < Query
      attribute_methods :fields, :like_text, :percent_terms_to_match, :min_term_freq,
                        :max_query_terms, :stop_words, :min_doc_freq, :max_doc_freq,
                        :min_word_length, :max_word_length, :boost_terms, :boost, :analyzer

      def to_hash(params={})
        h = {:fields => Array(@fields)}
        h[:like_text]              = @like_text unless @like_text.nil?
        h[:percent_terms_to_match] = @percent_terms_to_match unless @percent_terms_to_match.nil?
        h[:min_term_freq]          = @min_term_freq unless @min_term_freq.nil?
        h[:max_query_terms]        = @max_query_terms unless @max_query_terms.nil?
        h[:stop_words]             = @stop_words unless @stop_words.nil?
        h[:min_doc_freq]           = @min_doc_freq unless @min_doc_freq.nil?
        h[:max_doc_freq]           = @max_doc_freq unless @max_doc_freq.nil?
        h[:min_word_length]        = @min_word_length unless @min_word_length.nil?
        h[:max_word_length]        = @max_word_length unless @max_word_length.nil?
        h[:boost_terms]            = @boost_terms unless @boost_terms.nil?
        h[:boost]                  = @boost unless @boost.nil?
        h[:analyzer]               = @analyzer unless @analyzer.nil?
        {:more_like_this => h}
      end
    end
  end
end
