module Elasticsearch
  module QueryDsl
    class GeoPoint < SearchDefComponent
      attribute_methods :lat, :lon
      attr_reader :geohash

      def initialize(*args)
        first_arg = args.first
        unless first_arg.nil?
          if first_arg.is_a?(Array)
            @lon = first_arg[0]
            @lat = first_arg[1]
          elsif first_arg.is_a?(Hash)
            @lat = first_arg[:lat] || first_arg[:latitude]
            @lon = first_arg[:lon] || first_arg[:longitude]
          elsif first_arg =~ /.+,.+/
            @lat, @lon = first_arg.to_s.split(',')
            @lat.strip!
            @lon.strip!
          else
            @geohash = first_arg
          end
        end
      end

      def to_hash(params={})
        if !@geohash.nil?
          @geohash
        else
          {:lat => @lat, :lon => @lon}
        end
      end
    end
  end
end
