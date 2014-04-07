module Elasticsearch
  module QueryDsl
    class FuzzyQuery < Query
      attribute_methods :field, :value, :boost, :fuzziness, :prefix_length, :max_expansions

      def to_hash(params={})
        if @boost.nil? && @fuzziness.nil? && @prefix_length.nil? && @max_expansions.nil?
          inner = {@field => @value}
        else
          h = {:value => @value}
          h[:boost] = @boost unless @boost.nil?
          h[:fuzziness] = @fuzziness unless @fuzziness.nil?
          h[:prefix_length] = @prefix_length unless @prefix_length.nil?
          h[:max_expansions] = @max_expansions unless @max_expansions.nil?
          inner = {@field => h}
        end
        {:fuzzy => inner}
      end
    end
  end
end
