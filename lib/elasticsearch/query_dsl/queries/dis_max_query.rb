module Elasticsearch
  module QueryDsl
    class DisMaxQuery < Query
      query_container_method :queries
      attribute_methods :tie_breaker, :boost

      def to_hash(params={})
        h = {:queries => @queries.to_hash(params)}
        h[:tie_breaker] = @tie_breaker unless @tie_breaker.nil?
        h[:boost]       = @boost unless @boost.nil?
        {:dis_max => h}
      end
    end
  end
end
