module Elasticsearch
  module QueryDsl
    autoload :Logger, 'elasticsearch/query_dsl/logger'

    class ComponentNotFoundError < StandardError; end

    class ParamPlaceholder
      attr_reader :param_key
      def [](param_key)
        @param_key = param_key
        self
      end
    end

    COMPONENT_TYPE_MAP = {
      :basic_queries => {
        :common_terms => {
          :class_name => 'CommonTermsQuery',
          :aliases => [:common_terms_query]
        },
        :fuzzy_like_this => {
          :class_name => 'FuzzyLikeThisQuery',
          :aliases => [:fuzzy_like_this_query, :flt]
        },
        :fuzzy_like_this_field => {
          :class_name => 'FuzzyLikeThisFieldQuery',
          :aliases => [:fuzzy_like_this_field_query, :flt_field]
        },
        :geo_shape => {
          :class_name => 'GeoShapeQuery',
          :aliases => [:geo_shape_query]
        },
        :ids => {
          :class_name => 'IdsQuery',
          :aliases => [:ids_query]
        },
        :match_all => {
          :class_name => 'MatchAllQuery',
          :aliases => [:match_all_query]
        },
        :match => {
          :class_name => 'MatchQuery',
          :aliases => [:match_query]
        },
        :more_like_this => {
          :class_name => 'MoreLikeThisQuery',
          :aliases => [:more_like_this_query, :mlt]
        },
        :more_like_this_field => {
          :class_name => 'MoreLikeThisFieldQuery',
          :aliases => [:more_like_this_field_query, :mlt_field]
        },
        :multi_match => {
          :class_name => 'MultiMatchQuery',
          :aliases => [:multi_match_query]
        },
        :query_string => {
          :class_name => 'QueryStringQuery',
          :aliases => [:query_string_query]
        },
        :simple_query_rstring => {
          :class_name => 'SimpleQueryStringQuery',
          :aliases => [:simple_query_rstring_query]
        },
        :term => {
          :class_name => 'TermQuery',
          :aliases => [:term_query]
        },
        :terms => {
          :class_name => 'TermsQuery',
          :aliases => [:terms_query]
        }
      },
      :multi_term_queries => {
        :fuzzy => {
          :class_name => 'FuzzyQuery',
          :aliases => [:fuzzy_query]
        },
        :prefix => {
          :class_name => 'PrefixQuery',
          :aliases => [:prefix_query]
        },
        :range => {
          :class_name => 'RangeQuery',
          :aliases => [:range_query]
        },
        :regexp => {
          :class_name => 'RegexpQuery',
          :aliases => [:regexp_query]
        },
        :wildcard => {
          :class_name => 'WildcardQuery',
          :aliases => [:wildcard_query]
        }
      },
      :compound_queries => {
        :bool => {
          :class_name => 'BoolQuery',
          :aliases => [:bool_query]
        },
        :boosting => {
          :class_name => 'BoostingQuery',
          :aliases => [:boosting_query]
        },
        :constant_score => {
          :class_name => 'ConstantScoreQuery',
          :aliases => [:constant_score_query]
        },
        :custom_score => {
          :class_name => 'CustomScoreQuery',
          :aliases => [:custom_score_query]
        },
        :dis_max => {
          :class_name => 'DisMaxQuery',
          :aliases => [:dis_max_query]
        },
        :filtered => {
          :class_name => 'FilteredQuery',
          :aliases => [:filtered_query]
        },
        :function_score => {
          :class_name => 'FunctionScoreQuery',
          :aliases => [:function_score_query]
        },
        :has_child => {
          :class_name => 'HasChildQuery',
          :aliases => [:has_child_query]
        },
        :has_parent => {
          :class_name => 'HasParentQuery',
          :aliases => [:has_parent_query]
        },
        :indices => {
          :class_name => 'IndicesQuery',
          :aliases => [:indices_query]
        },
        :nested => {
          :class_name => 'NestedQuery',
          :aliases => [:nested_query]
        },
        :top_children => {
          :class_name => 'TopChildrenQuery',
          :aliases => [:top_children_query]
        }
      },
      :span_queries => {
        :span_first => {
          :class_name => 'SpanFirstQuery',
          :aliases => [:span_first_query]
        },
        :span_multi_term => {
          :class_name => 'SpanMultiTermQuery',
          :aliases => [:span_multi_term_query]
        },
        :span_near => {
          :class_name => 'SpanNearQuery',
          :aliases => [:span_near_query]
        },
        :span_not => {
          :class_name => 'SpanNotQuery',
          :aliases => [:span_not_query]
        },
        :span_or => {
          :class_name => 'SpanOrQuery',
          :aliases => [:span_or_query]
        },
        :span_term => {
          :class_name => 'SpanTermQuery',
          :aliases => [:span_term_query]
        }
      },
      :filters => {
        :_and => {
          :class_name => 'AndFilter',
          :aliases => [:and_filter]
        },
        :bool => {
          :class_name => 'BoolFilter',
          :aliases => [:bool_filter]
        },
        :exists => {
          :class_name => 'ExistsFilter',
          :aliases => [:exists_filter]
        },
        :geo_bounding_box => {
          :class_name => 'GeoBoundingBoxFilter',
          :aliases => [:geo_bounding_box_filter]
        },
        :geo_distance => {
          :class_name => 'GeoDistanceFilter',
          :aliases => [:geo_distance_filter]
        },
        :geo_distance_range => {
          :class_name => 'GeoDistanceRangeFilter',
          :aliases => [:geo_distance_range_filter]
        },
        :geo_polygon => {
          :class_name => 'GeoPolygonFilter',
          :aliases => [:geo_polygon_filter]
        },
        :geoShape => {
          :class_name => 'GeoShapeFilter',
          :aliases => [:geoShape_filter]
        },
        :geohash_cell => {
          :class_name => 'GeohashCellFilter',
          :aliases => [:geohash_cell_filter]
        },
        :has_child => {
          :class_name => 'HasChildFilter',
          :aliases => [:has_child_filter]
        },
        :has_parent => {
          :class_name => 'HasParentFilter',
          :aliases => [:has_parent_filter]
        },
        :ids => {
          :class_name => 'IdsFilter',
          :aliases => [:ids_filter]
        },
        :indices => {
          :class_name => 'IndicesFilter',
          :aliases => [:indices_filter]
        },
        :limit => {
          :class_name => 'LimitFilter',
          :aliases => [:limit_filter]
        },
        :match_all => {
          :class_name => 'MatchAllFilter',
          :aliases => [:match_all_filter]
        },
        :missing => {
          :class_name => 'MissingFilter',
          :aliases => [:missing_filter]
        },
        :nested => {
          :class_name => 'NestedFilter',
          :aliases => [:nested_filter]
        },
        :not => {
          :class_name => 'NotFilter',
          :aliases => [:not_filter]
        },
        :or => {
          :class_name => 'OrFilter',
          :aliases => [:or_filter]
        },
        :prefix => {
          :class_name => 'PrefixFilter',
          :aliases => [:prefix_filter]
        },
        :query => {
          :class_name => 'QueryFilter',
          :aliases => [:query_filter]
        },
        :range => {
          :class_name => 'RangeFilter',
          :aliases => [:range_filter]
        },
        :regexp => {
          :class_name => 'RegexpFilter',
          :aliases => [:regexp_filter]
        },
        :script => {
          :class_name => 'ScriptFilter',
          :aliases => [:script_filter]
        },
        :term => {
          :class_name => 'TermFilter',
          :aliases => [:term_filter]
        },
        :terms => {
          :class_name => 'TermsFilter',
          :aliases => [:terms_filter]
        },
        :type => {
          :class_name => 'TypeFilter',
          :aliases => [:type_filter]
        }
      },
      :sorts => {
        'field_sort' => {
          :class_name => 'FieldSort',
          :aliases => [:field]
        },
        'geo_distance_sort' => {
          :class_name => 'GeoDistanceSort',
          :aliases => [:geo_distance]
        },
        'script_sort' => {
          :class_name => 'ScriptSort',
          :aliases => [:script]
        }
      },
      :script_fields => {
        'script_field' => {
          :class_name => 'ScriptField',
          :aliases => []
        }
      },
      :score_functions => {
        'boost_factor' => {
          :class_name => 'BoostFactorScoreFunction',
          :aliases => []
        },
        'exp' => {
          :class_name => 'ExpDecayScoreFunction',
          :aliases => [:exp_decay]
        },
        'field_value_factor' => {
          :class_name => 'FieldValueFactorScoreFunction',
          :aliases => []
        },
        'gauss' => {
          :class_name => 'GaussDecayScoreFunction',
          :aliases => [:gauss_decay]
        },
        'linear' => {
          :class_name => 'LinearDecayScoreFunction',
          :aliases => [:linear_decay]
        },
        'random_score' => {
          :class_name => 'RandomScoreFunction',
          :aliases => [:random]
        },
        'script_score' => {
          :class_name => 'ScriptScoreFunction',
          :aliases => []
        }
      }
    }

    def self.component_method_names(component_type)
      COMPONENT_TYPE_MAP[component_type].keys
    end

    def self.component_method_aliases(component_type)
      COMPONENT_TYPE_MAP[component_type].values.inject([]){|arr, ci| arr.concat(ci[:aliases])}
    end

    def self.each_component_method_alias(component_type)
      COMPONENT_TYPE_MAP[:filters].each do |method_name, component_info|
        component_info[:aliases].each do |method_alias|
          yield  method_alias, method_name
        end
      end
    end
  end
end
unless defined?(ES)
  ES = Elasticsearch
end

require 'multi_json'
require 'elasticsearch/query_dsl/version'
require 'elasticsearch/query_dsl/search_def_components.rb'
require 'elasticsearch/query_dsl/search_def_component.rb'
require 'elasticsearch/query_dsl/search_def.rb'
require 'elasticsearch/query_dsl/query.rb'
require 'elasticsearch/query_dsl/filter.rb'
require 'elasticsearch/query_dsl/sort.rb'
require 'elasticsearch/query_dsl/score_function.rb'
require 'elasticsearch/query_dsl/script_param_values.rb'
Dir[File.join(File.dirname(__FILE__), 'query_dsl', 'filters', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'query_dsl', 'queries', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'query_dsl', 'sorts', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'query_dsl', 'script_fields', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'query_dsl', 'score_functions', '*.rb')].each {|file| require file }
