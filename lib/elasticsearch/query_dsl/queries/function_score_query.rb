module Elasticsearch
  module QueryDsl
    class FunctionScoreQuery < Query
      attribute_methods :boost, :max_boost, :score_mode, :boost_mode
      query_container_method :query
      filter_container_method :filter
      score_function_container_method :functions, :delegate_methods_from_top => true, :delegate_aliases_from_top => true

      def to_hash(params={})
        h = {}
        h[:boost] = @boost unless @boost.nil?
        h[:max_boost] = @max_boost unless @max_boost.nil?
        h[:boost_mode] = @boost_mode unless @boost_mode.nil?
        h[:score_mode] = @score_mode unless @score_mode.nil?
        h[:query] = @query.to_hash(params) unless @query.nil?
        h[:filter] = @filter.to_hash(params) unless @filter.nil?
        unless @functions.nil?
          functions = @functions.to_hash(params)
          if functions.is_a?(Hash)
            h.update(functions)
          else
            h[:functions] = functions
          end
        end
        {:function_score => h}
      end
    end
  end
end
