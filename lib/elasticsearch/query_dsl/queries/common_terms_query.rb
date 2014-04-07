module Elasticsearch
  module QueryDsl
    class CommonTermsQuery < Query
      attribute_methods :field, :query, :cutoff_frequency, :low_freq_operator, :minimum_should_match
    end
  end
end
