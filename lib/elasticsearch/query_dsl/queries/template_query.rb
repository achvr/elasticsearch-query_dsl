module Elasticsearch
  module QueryDsl
    class TemplateQuery < Query
      attribute_method :query
      script_params_container_method :params

      def to_hash(params={})
        h = {:query => @query}
        h[:params] = @params unless @params.nil? || @params.empty?
        {:template => h}
      end
    end
  end
end
