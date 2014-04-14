module Elasticsearch
  module QueryDsl
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
  end
end
