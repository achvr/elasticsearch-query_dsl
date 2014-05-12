module Elasticsearch
  module QueryDsl
    class FieldSort < Sort
      attribute_methods :field, :order, :nested_filter, :missing, :ignore_unmapped
      attribute_method :mode, :alias => :sort_mode

      def to_hash(params={})
        h = {}
        h[:order]           = @order unless @order.nil?
        h[:mode]            = @mode unless @mode.nil?
        h[:nested_filter]   = @nested_filter unless @nested_filter.nil?
        h[:missing]         = @missing unless @missing.nil?
        h[:ignore_unmapped] = @ignore_unmapped unless @ignore_unmapped.nil?
        {@field => h}
      end
    end
  end
end
