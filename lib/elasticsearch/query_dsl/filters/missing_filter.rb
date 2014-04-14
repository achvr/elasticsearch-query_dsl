module Elasticsearch
  module QueryDsl
    class MissingFilter < Filter
      attribute_methods :field, :existence, :null_value

      def to_hash(params={})
        h = {:field => @field}
        h[:existence]  = @existence unless @existence.nil?
        h[:null_value] = @null_value unless @null_value.nil?
        {:missing => h}
      end
    end
  end
end
