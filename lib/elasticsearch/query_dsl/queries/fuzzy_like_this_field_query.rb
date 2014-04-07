module Elasticsearch
  module QueryDsl
    class FuzzyLikeThisFieldQuery < Query
      attribute_methods :field, :like_text, :ignore_tf, :max_query_terms, :fuzziness, :prefix_length, :boost, :analyzer
    end
  end
end
