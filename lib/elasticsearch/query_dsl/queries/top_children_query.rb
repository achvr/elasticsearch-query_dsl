module Elasticsearch
  module QueryDsl
    class TopChildrenQuery < Query
      query_container_method :query
      attribute_methods :type, :score, :factor, :incremental_factor
      attribute_method :scope, :alias => :_scope

      def to_hash(params={})
        h = {:query => @query}
        h[:_scope]             = @scope unless @scope.nil?
        h[:type]               = @type unless @type.nil?
        h[:query]              = @query.to_hash(params) unless @query.nil? || @query.empty?
        h[:score]              = @score unless @score.nil?
        h[:factor]             = @factor unless @factor.nil?
        h[:incremental_factor] = @incremental_factor unless @incremental_factor.nil?
        {:top_children => h}
      end
   end
  end
end
