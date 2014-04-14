module Elasticsearch
  module QueryDsl
    class QueryContainer < SearchDefComponent
      include SearchDefComponents
      component_methods :basic_queries, :multi_term_queries, :compound_queries, :span_queries
    end

    class MultiTermQueryContainer < SearchDefComponent
      include SearchDefComponents
      component_methods :multi_term_queries
    end

    class SpanQueryContainer < SearchDefComponent
      include SearchDefComponents
      component_methods :span_queries
    end

    class FilterContainer < SearchDefComponent
      include SearchDefComponents
      component_methods :filters
    end

    class SortContainer < SearchDefComponent
      include SearchDefComponents
      component_methods :sorts
    end

    class ScriptFieldContainer < SearchDefComponent
      include SearchDefComponents
      component_methods :script_fields

      def to_hash(params={})
        if empty?
          nil
        elsif components.length == 1
          components.first.to_hash(params)
        else
          components.inject{|comp, other_comp| comp.to_hash(params).update(other_comp.to_hash(params))}
        end
      end
    end

    class ScoreFunctionContainer < SearchDefComponent
      include SearchDefComponents
      component_methods :score_functions

      def to_hash(params={})
        if empty?
          nil
        elsif components.length == 1 && (components.first.filter.nil? || components.first.filter.empty?)
          components.first.to_hash(params)
        else
          components.collect do |component|
            if !component.filter.nil? && !component.filter.empty?
              {:filter => component.filter.to_hash(params)}.update(component.to_hash(params))
            else
              component.to_hash(params)
            end
          end
        end
      end
    end

    class GeoPointContainer < SearchDefComponent
      include SearchDefComponents
      component_methods :geo_point
    end

    class GeoShapeContainer < SearchDefComponent
      include SearchDefComponents
      # component_methods :geo_shape
    end

    class ScriptParamsContainer < SearchDefComponent
      def self.component_types
        [:params]
      end

      def initialize(attributes={})
        @params_hash = {}
        super
      end

      def method_missing(method_symbol, *args)
        @params_hash[method_symbol] = args.first
      end

      def to_hash(params={})
        @params_hash.clone
      end
    end
  end
end
