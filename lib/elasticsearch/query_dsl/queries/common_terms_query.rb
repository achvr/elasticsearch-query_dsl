module Elasticsearch
  module QueryDsl
    class CommonTermsQuery < Query
      attribute_methods :field, :query, :cutoff_frequency, :low_freq_operator, :minimum_should_match

      def to_hash(params={})
        h = {:query => @query}
        h[:cutoff_frequency]     = @cutoff_frequency unless @cutoff_frequency.nil?
        h[:low_freq_operator]    = @low_freq_operator unless @low_freq_operator.nil?
        h[:minimum_should_match] = @minimum_should_match unless @minimum_should_match.nil?
        {:common => {@field => h}}
      end
    end
  end
end
