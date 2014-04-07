module Elasticsearch
  module QueryDsl
    class GeoBoundingBoxFilter < Filter
      attribute_methods :field, :type, :cache

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

      class GeoBoundingBox < SearchDefComponent
        attribute_methods :top, :left, :bottom, :right

        def top_left(*args, &block)
          @top_left ||= GeoPoint.new(*args)
          @top_left.instance_exec(&block) unless block.nil?
          @top_left
        end

        def bottom_right(*args, &block)
          @bottom_right ||= GeoPoint.new(*args)
          @bottom_right.instance_exec(&block) unless block.nil?
          @bottom_right
        end

        def to_hash(params={})
          h ={}
          if !@top_left.nil?
            h[:top_left] = @top_left.to_hash(params)
          end
          if !@bottom_right.nil?
            h[:bottom_right] = @bottom_right.to_hash(params)
          end
          h[:top]    = @top unless @top.nil?
          h[:left]   = @left unless @left.nil?
          h[:bottom] = @bottom unless @bottom.nil?
          h[:right]  = @right unless @right.nil?
          h
        end
      end

      def coordinates(*args, &block)
        @coordinates ||= GeoBoundingBox.new
        @coordinates.instance_exec(&block) unless block.nil?
        @coordinates
      end
      delegate :top, :left, :bottom, :right, :top_left, :bottom_right, :to => :coordinates

      def to_hash(params={})
        h = {@field => @coordinates.to_hash(params)}
        h[:type]   = @type unless @type.nil?
        h[:_cache] = @cache unless @cache.nil?
        {:geo_bounding_box => h}
      end
    end
  end
end
