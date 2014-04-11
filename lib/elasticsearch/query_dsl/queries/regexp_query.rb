module Elasticsearch
  module QueryDsl
    class RegexpQuery < Query
      attribute_methods :field, :value, :flags, :boost

      def to_hash(params={})
        if @flags.nil? && @boost.nil?
          h = @value
        else
          h = {:value => @value}
          h[:flags] = @flags unless @flags.nil?
          h[:boost] = @boost unless @boost.nil?
        end
        {:regexp => {@field => h}}
      end
    end
  end
end
