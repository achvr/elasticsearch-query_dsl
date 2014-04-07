module Elasticsearch
  module QueryDsl
    class DecayScoreFunction < ScoreFunction
      attribute_methods :field, :origin, :scale, :offset, :decay

      def to_hash(params={})
        h = {}
        h[:origin] = @origin
        h[:scale]  = @scale
        h[:offset] = @offset unless @offset.nil?
        h[:decay]  = @decay unless @decay.nil?
        {self.function_name => {@field => h}}
      end
    end
  end
end
