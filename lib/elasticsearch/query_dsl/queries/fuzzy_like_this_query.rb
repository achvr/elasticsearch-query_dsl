module Elasticsearch
  module QueryDsl
    class FuzzyLikeThisQuery < Query
      attribute_methods :fields, :like_text, :ignore_tf, :max_query_terms, :fuzziness, :prefix_length, :boost, :analyzer
    end
  end
end
