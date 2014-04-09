module Elasticsearch
  module QueryDsl
    module SearchDefComponents
      def self.included(mod)
        mod.extend(ClassMethods)
      end

      module ClassMethods
        attr_reader :component_types

        def component_methods(*component_types)
          @component_types = component_types
          component_types.each do |component_type|
            COMPONENT_TYPE_MAP[component_type].each do |method_name, component_info|
              define_method method_name do |*args, &block|
                component = Elasticsearch::QueryDsl.const_get(component_info[:class_name]).new(*args)
                component.set_search_def(search_def)
                unless block.nil?
                  component.instance_exec(&block)
                end
                components << component
                component
              end
              component_info[:aliases].each do |method_alias|
                class_eval("alias :#{method_alias} :#{method_name}")
              end
            end
          end
        end
      end

      def add_component(search_def_component)
        unless search_def_component.is_a?(SearchDefComponent)
          raise TypeError, 'Componment must be a type of SearchDefComponent'
        end
        components << search_def_component.clone
      end

      def to_hash(params={})
        if empty?
          nil
        elsif components.length == 1
          components.first.to_hash(params)
        else
          components.collect{|component| component.to_hash(params)}
        end
      end

      def empty?
        components.empty?
      end

      def length
        components.length
      end
      alias :size :length

      def reset(&block)
        @components.clear unless @components.nil?
        if block_given?
          instance_exec(&block)
        else
          self
        end
      end

      protected

      def components
        @components ||= []
      end

    end
  end
end
