module Elasticsearch
  module QueryDsl
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
        def delegate_methods(methods, to_method)
          Array(methods).each do |method|
            class_eval <<-EOS, __FILE__, __LINE__ + 1
              def #{method}(*args, &block)
                #{to_method}.#{method}(*args, &block)
              end
            EOS
          end
        end

        def container_method(container_class, *args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          args.flatten.each do |method_name|
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
            component_types = container_class.component_types
            unless component_types.nil? || component_types.empty?
              component_types.each do |component_type|
                if options[:delegate_methods_from_top]
                  delegate_methods(QueryDsl.component_method_names(component_type), method_name)
                end
                if options[:delegate_aliases_from_top]
                  delegate_methods(QueryDsl.component_method_aliases(component_type), method_name)
                end
              end
            end
          end
        end

        def query_container_method(*args)
          container_method(QueryContainer, *args)
        end
        alias :query_container_methods :query_container_method

        def multi_term_query_container_method(*args)
          container_method(MultiTermQueryContainer, *args)
        end
        alias :multi_term_query_container_methods :multi_term_query_container_method

        def span_query_container_method(*args)
          container_method(SpanQueryContainer, *args)
        end
        alias :span_query_container_methods :span_query_container_method

        def filter_container_method(*args)
          container_method(FilterContainer, *args)
        end
        alias :filter_container_methods :filter_container_method

        def sort_container_method(*args)
          container_method(SortContainer, *args)
        end
        alias :sort_container_methods :sort_container_method

        def script_field_container_method(*args)
          container_method(ScriptFieldContainer, *args)
        end
        alias :script_field_container_methods :script_field_container_method

        def score_function_container_method(*args)
          container_method(ScoreFunctionContainer, *args)
        end
        alias :score_function_container_methods :score_function_container_method

        def geo_point_container_method(*args)
          container_method(GeoPointContainer, *args)
        end
        alias :geo_point_container_methods :geo_point_container_method

        def geo_shape_container_method(*args)
          container_method(GeoShapeContainer, *args)
        end
        alias :geo_shape_container_methods :geo_shape_container_method

        def script_params_container_method(*args)
          container_method(ScriptParamsContainer, *args)
        end
        alias :script_params_container_methods :script_params_container_method

        def attribute_method(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          args.flatten.each do |method_name|
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
            aliases = Array(options[:alias] || options[:aliases])
            aliases.each do |_alias|
              alias_method _alias, method_name
            end
          end
        end
        alias :attribute_methods :attribute_method
      end
    end
  end
end
