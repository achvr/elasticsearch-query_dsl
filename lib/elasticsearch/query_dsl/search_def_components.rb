module Elasticsearch
  module QueryDsl
    module SearchDefComponents
      COMPONENT_TYPE_MAP = {
        :query => {
          :query => 'QueryContainer'
        },
        :basic_queries => {
          :common_terms => 'CommonTermsQuery',
          :fuzzy_like_this => 'FuzzyLikeThisQuery',
          :fuzzy_like_this_field => 'FuzzyLikeThisFieldQuery',
          :fuzzy => 'FuzzyQuery',
          :geo_shape => 'GeoShapeQuery',
          :ids => 'IdsQuery',
          :match_all => 'MatchAllQuery',
          :match => 'MatchQuery',
          :more_like_this => 'MoreLikeThisQuery',
          :more_like_this_field => 'MoreLikeThisFieldQuery',
          :multi_match => 'MultiMatchQuery',
          :prefix => 'PrefixQuery',
          :query_string => 'QueryStringQuery',
          :range => 'RangeQuery',
          :regexp => 'RegexpQuery',
          :simple_query_rstring => 'SimpleQueryStringQuery',
          :span_first => 'SpanFirstQuery',
          :span_multi_term => 'SpanMultiTermQuery',
          :span_near => 'SpanNearQuery',
          :span_not => 'SpanNotQuery',
          :span_or => 'SpanOrQuery',
          :span_term => 'SpanTermQuery',
          :term => 'TermQuery',
          :terms => 'TermsQuery',
          :wildcard => 'WildcardQuery'
        },
        :compound_queries => {
          :bool => 'BoolQuery',
          :boosting => 'BoostingQuery',
          :constant_score => 'ConstantScoreQuery',
          :custom_score => 'CustomScoreQuery',
          :dis_max => 'DisMaxQuery',
          :filtered => 'FilteredQuery',
          :function_score => 'FunctionScoreQuery',
          :has_child => 'HasChildQuery',
          :has_parent => 'HasParentQuery',
          :indices => 'IndicesQuery',
          :nested => 'NestedQuery',
          :top_children => 'TopChildrenQuery'
        },
        :filters => {
          :and => 'AndFilter',
          :bool => 'BoolFilter',
          :exists => 'ExistsFilter',
          :geo_bounding_box => 'GeoBoundingBoxFilter',
          :geo_distance => 'GeoDistanceFilter',
          :geo_distance_range => 'GeoDistanceRangeFilter',
          :geo_polygon => 'GeoPolygonFilter',
          :geoShape => 'GeoShapeFilter',
          :geohash_cell => 'GeohashCellFilter',
          :has_child => 'HasChildFilter',
          :has_parent => 'HasParentFilter',
          :ids => 'IdsFilter',
          :indices => 'IndicesFilter',
          :limit => 'LimitFilter',
          :match_all => 'MatchAllFilter',
          :missing => 'MissingFilter',
          :nested => 'NestedFilter',
          :not => 'NotFilter',
          :or => 'OrFilter',
          :prefix => 'PrefixFilter',
          :query => 'QueryFilter',
          :range => 'RangeFilter',
          :regexp => 'RegexpFilter',
          :script => 'ScriptFilter',
          :term => 'TermFilter',
          :terms => 'TermsFilter',
          :type => 'TypeFilter'
        }
      }

      def self.included(mod)
        mod.extend(ClassMethods)
      end

      module ClassMethods
        def component_methods(*component_types)
          component_types.each do |component_type|
            COMPONENT_TYPE_MAP[component_type].each do |method_name, component_class_name|
              define_method method_name do |*args, &block|
                component = Elasticsearch::QueryDsl.const_get(component_class_name).new(*args)
                puts "-=-=-=->>> In component method (#{method_name}) on #{self.class.name}, what is search_def?: #{search_def.inspect}"
                component.set_search_def(search_def)
                unless block.nil?
                  component.instance_exec(&block)
                end
                components << component
                component
              end
            end
          end
        end
      end

      def to_hash(params={})
        if empty?
          nil
        elsif components.length == 1
          components.first.to_hash(params)
        else
          components.collect{|component| component.to_hash(params)}
        end
      end

      def empty?
        components.empty?
      end

      protected

      def components
        @components ||= []
      end

    end
  end
end
