module Elasticsearch
  module QueryDsl
    class FuzzyLikeThisFieldQuery < Query
      attribute_methods :field, :like_text, :ignore_tf, :max_query_terms, :fuzziness, :prefix_length, :boost, :analyzer

      def to_hash(params={})
        h = {}
        h[:like_text]       = @like_text unless @like_text.nil?
        h[:ignore_tf]       = @ignore_tf unless @ignore_tf.nil?
        h[:max_query_terms] = @max_query_terms unless @max_query_terms.nil?
        h[:fuzziness]       = @fuzziness unless @fuzziness.nil?
        h[:prefix_length]   = @prefix_length unless @prefix_length.nil?
        h[:boost]           = @boost unless @boost.nil?
        h[:analyzer]        = @analyzer unless @analyzer.nil?
        {:fuzzy_like_this_field => {@field => h}}
      end
    end
  end
end
