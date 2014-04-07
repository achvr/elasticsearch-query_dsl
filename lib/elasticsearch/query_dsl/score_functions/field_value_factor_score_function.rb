module Elasticsearch
  module QueryDsl
    class FieldValueFactorScoreFunction < ScoreFunction
      attribute_methods :field, :factor, :modifier

      def to_hash(params={})
        h = {:field => @field}
        h[:factor] = @factor unless @factor.nil?
        h[:modifier] = @modifier unless @modifier.nil?
        {:field_value_factor => h}
      end
    end
  end
end
