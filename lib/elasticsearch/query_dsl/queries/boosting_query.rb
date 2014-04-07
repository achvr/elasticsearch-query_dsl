module Elasticsearch
  module QueryDsl
    class BoostingQuery < Query
      query_container_methods :positive, :negative
      attribute_method :negative_boost
    end
  end
end
