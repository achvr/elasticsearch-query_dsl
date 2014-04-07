module Elasticsearch
  module QueryDsl
    class ScoreFunction < SearchDefComponent
      filter_container_method :filter
    end
  end
end
