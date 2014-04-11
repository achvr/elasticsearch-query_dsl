module Elasticsearch
  module QueryDsl
    class QueryStringQuery < Query
      attribute_methods :query, :default_field, :default_operator, :analyzer,
                        :allow_leading_wildcard, :lowercase_expanded_terms,
                        :enable_position_increments, :fuzzy_max_expansions,
                        :fuzziness, :fuzzy_prefix_length, :phrase_slop, :boost,
                        :analyze_wildcard, :auto_generate_phrase_queries,
                        :minimum_should_match, :lenient, :locale

      def to_hash(params={})
        h = {}
        h[:query]                        = @query unless @query.nil?
        h[:default_field]                = @default_field unless @default_field.nil?
        h[:default_operator]             = @default_operator unless @default_operator.nil?
        h[:analyzer]                     = @analyzer unless @analyzer.nil?
        h[:allow_leading_wildcard]       = @allow_leading_wildcard unless @allow_leading_wildcard.nil?
        h[:lowercase_expanded_terms]     = @lowercase_expanded_terms unless @lowercase_expanded_terms.nil?
        h[:enable_position_increments]   = @enable_position_increments unless @enable_position_increments.nil?
        h[:fuzzy_max_expansions]         = @fuzzy_max_expansions unless @fuzzy_max_expansions.nil?
        h[:fuzziness]                    = @fuzziness unless @fuzziness.nil?
        h[:fuzzy_prefix_length]          = @fuzzy_prefix_length unless @fuzzy_prefix_length.nil?
        h[:phrase_slop]                  = @phrase_slop unless @phrase_slop.nil?
        h[:boost]                        = @boost unless @boost.nil?
        h[:analyze_wildcard]             = @analyze_wildcard unless @analyze_wildcard.nil?
        h[:auto_generate_phrase_queries] = @auto_generate_phrase_queries unless @auto_generate_phrase_queries.nil?
        h[:minimum_should_match]         = @minimum_should_match unless @minimum_should_match.nil?
        h[:lenient]                      = @lenient unless @lenient.nil?
        h[:locale]                       = @locale unless @locale.nil?
        {:query_string => h}
      end
    end
  end
end
