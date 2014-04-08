module Elasticsearch
  module QueryDsl
    class ParamPlaceholder
      attr_reader :param_key
      def [](param_key)
        @param_key = param_key
        self
      end
    end

    class SearchDefComponent
      attr_reader :id
      attr_reader :search_def

      def initialize(attributes={})
        @id = attributes.delete(:id)
        @search_def = attributes.delete(:search_def)
        attributes.each do |attr_name, attr_value|
          instance_variable_set("@#{attr_name}".to_sym, attr_value)
        end
        if !@id.nil? && !@search_def.nil?
          @search_def.register_component(@id, self)
        end
      end

      def set_search_def(search_def)
        @search_def = search_def
        if !@id.nil? && !@search_def.nil?
          @search_def.register_component(@id, self)
        end
      end

      def update(&block)
        instance_exec(&block)
      end

      def as(component_id, &block)
        @id = component_id
        if !@id.nil? && !@search_def.nil?
          @search_def.register_component(@id, self)
        end
        if block_given?
          instance_exec(&block)
        end
        self
      end

      def params
        ParamPlaceholder.new
      end

      def attr_eval(value, params)
        if value.nil?
          nil
        elsif value.is_a?(Proc)
          value.call
        elsif value.is_a?(ParamPlaceholder)
          params[value.param_key]
        else
          value
        end
      end

      def to_json(params={}, options={})
        MultiJson.dump(to_hash(params), :pretty => !!options[:pretty])
      end

      class << self
        def container_method(container_class, *method_names)
          method_names.flatten.each do |method_name|
            define_method method_name do |*args, &block|
              ivar_sym = "@#{method_name}".to_sym
              ivar = instance_variable_get(ivar_sym)
              if ivar.nil?
                ivar = instance_variable_set(ivar_sym, container_class.new(*args))
              end
              ivar.set_search_def(search_def) unless search_def.nil?
              unless block.nil?
                ivar.instance_exec(*args, &block)
              end
              ivar
            end
          end
        end
        def query_container_method(*method_names)
          container_method(QueryContainer, *method_names)
        end
        alias :query_container_methods :query_container_method

        def filter_container_method(*method_names)
          container_method(FilterContainer, *method_names)
        end
        alias :filter_container_methods :filter_container_method

        def sort_container_method(*method_names)
          container_method(SortContainer, *method_names)
        end
        alias :sort_container_methods :sort_container_method

        def script_field_container_method(*method_names)
          container_method(ScriptFieldContainer, *method_names)
        end
        alias :script_field_container_methods :script_field_container_method

        def score_function_container_method(*method_names)
          container_method(ScoreFunctionContainer, *method_names)
        end
        alias :score_function_container_methods :score_function_container_method

        def attribute_method(*method_names)
          method_names.flatten.each do |method_name|
            define_method method_name do |*args, &block|
              ivar_sym = "@#{method_name}".to_sym
              if !block.nil?
                instance_variable_set(ivar_sym, block.call(*args))
                self
              elsif args.empty?
                instance_variable_get(ivar_sym)
              elsif args.length == 1
                instance_variable_set(ivar_sym, args.first)
                self
              end
            end
          end
        end
        alias :attribute_methods :attribute_method
      end
    end

    class QueryContainer < SearchDefComponent
      include SearchDefComponents
      component_methods :basic_queries, :compound_queries
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
  end
end
