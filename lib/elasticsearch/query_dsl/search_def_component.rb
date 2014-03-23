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
        puts "===> SearchDefComponent attributes: #{attributes.inspect}"
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
        puts "IN set_search_def: #{search_def}"
        @search_def = search_def
        if !@id.nil? && !@search_def.nil?
          @search_def.register_component(@id, self)
        end
      end

      def update(&block)
        instance_exec(&block)
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
        def query_container_method(*method_names)
          method_names.flatten.each do |method_name|
            define_method method_name do |*args, &block|
              puts "~~~> Args passed to query_container_method #{method_name}: #{args.inspect}"
              ivar_sym = "@#{method_name}".to_sym
              ivar = instance_variable_get(ivar_sym)
              if ivar.nil?
                ivar = instance_variable_set(ivar_sym, QueryContainer.new(*args))
              end
              ivar.set_search_def(search_def) unless search_def.nil?
              unless block.nil?
                ivar.instance_exec(*args, &block)
              end
              ivar
            end
          end
        end
        alias :query_container_methods :query_container_method

        def filter_container_method(*method_names)
          method_names.flatten.each do |method_name|
            define_method method_name do |*args, &block|
              ivar_sym = "@#{method_name}".to_sym
              ivar = instance_variable_get(ivar_sym)
              if ivar.nil?
                ivar = instance_variable_set(ivar_sym, FilterContainer.new(*args))
              end
              unless block.nil?
                ivar.instance_exec(*args, &block)
              end
              ivar
            end
          end
        end
        alias :filter_container_methods :filter_container_method

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

  end
end
