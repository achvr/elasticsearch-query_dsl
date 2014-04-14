module Elasticsearch
  module QueryDsl
    class QueryFilter < Filter
      query_container_method :query
      attribute_method :cache, :alias => :_cache

      def to_hash(params={})
        if @cache.nil?
          {:query => @query.to_hash(params)}
        else
          {:fquery => {:query => @query.to_hash(params), :_cache => @cache}}
        end
      end
    end
  end
end
