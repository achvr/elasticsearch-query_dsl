module Elasticsearch
  module QueryDsl
    class MultiMatchQuery < Query
      query_container_method :query
    end
  end
end
