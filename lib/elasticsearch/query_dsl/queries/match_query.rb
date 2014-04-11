module Elasticsearch
  module QueryDsl
    class MatchQuery < Query
      attribute_methods :type, :field, :query, :operator, :analyzer, :fuzziness,
                        :prefix_length, :max_expansions, :zero_terms_query,
                        :cutoff_frequency, :lenient

      def to_hash(params={})
        h = {}
        h[:operator]         = @operator unless @operator.nil?
        h[:analyzer]         = @analyzer unless @analyzer.nil?
        h[:fuzziness]        = @fuzziness unless @fuzziness.nil?
        h[:prefix_length]    = @prefix_length unless @prefix_length.nil?
        h[:max_expansions]   = @max_expansions unless @max_expansions.nil?
        h[:zero_terms_query] = @zero_terms_query unless @zero_terms_query.nil?
        h[:cutoff_frequency] = @cutoff_frequency unless @cutoff_frequency.nil?
        h[:lenient]          = @lenient unless @lenient.nil?
        if h.empty?
          {get_type => {@field => @query}}
        else
          h[:query] = @query
          {get_type => {@field => h}}
        end
      end

      protected

      def get_type
        type || :match
      end
    end
  end
end
