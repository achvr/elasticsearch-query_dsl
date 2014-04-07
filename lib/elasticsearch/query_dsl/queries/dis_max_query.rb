module Elasticsearch
  module QueryDsl
    class DisMaxQuery < Query
      query_container_method :queries
      attribute_methods :tie_breaker, :boost
    end
  end
end
