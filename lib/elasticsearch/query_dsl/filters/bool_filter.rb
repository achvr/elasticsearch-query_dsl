module Elasticsearch
  module QueryDsl
    class BoolFilter < Filter
      filter_container_methods :must, :must_not, :should
      attribute_method :cache, :alias => :_cache

      def to_hash(params={})
        h = {}
        h[:must]     = @must.to_hash(params) unless @must.nil? || @must.empty?
        h[:must_not] = @must_not.to_hash(params) unless @must_not.nil? || @must_not.empty?
        h[:should]   = @should.to_hash(params) unless @should.nil? || @should.empty?
        h[:_cache]   = @cache unless @cache.nil?
        {:bool => h}
      end
    end
  end
end
