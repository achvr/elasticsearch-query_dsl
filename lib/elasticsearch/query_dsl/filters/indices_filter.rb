module Elasticsearch
  module QueryDsl
    class IndicesFilter < Filter
      attribute_method :indices, :alias => :index
      filter_container_methods :filter, :no_match_filter

      def to_hash(params={})
        h = {:indices => Array(@indices)}
        h[:filter]          = @filter.to_hash(params)
        h[:no_match_filter] = @no_match_filter unless @no_match_filter.nil? || @no_match_filter.empty?
        {:indices => h}
      end
    end
  end
end
