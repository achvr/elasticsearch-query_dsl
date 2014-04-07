module Elasticsearch
  module QueryDsl
    class MatchAllQuery < Query
      attribute_method :boost

      def to_hash(params={})
        h = {}
        h[:boost] = @boost unless @boost.nil?
        {:match_all => h}
      end
    end
  end
end
