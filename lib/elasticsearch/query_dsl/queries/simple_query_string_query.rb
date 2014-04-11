module Elasticsearch
  module QueryDsl
    class SimpleQueryStringQuery < Query
      attribute_methods :query, :fields, :default_operator, :analyzer,
                        :flags, :lowercase_expanded_terms, :locale

      def to_hash(params={})
        h = {:query => @query}
        h[:fields]                   = @fields unless @fields.nil?
        h[:default_operator]         = @default_operator unless @default_operator.nil?
        h[:analyzer]                 = @analyzer unless @analyzer.nil?
        h[:flags]                    = @flags unless @flags.nil?
        h[:lowercase_expanded_terms] = @lowercase_expanded_terms unless @lowercase_expanded_terms.nil?
        h[:locale]                   = @locale unless @locale.nil?
        {:simple_query_string => h}
      end
    end
  end
end
