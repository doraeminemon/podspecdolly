require 'digest/md5'
module Podspecdolly
  class Shard
    def initialize(name, length)
      @name = name
      @lengths = length
    end

    def shard
      hashed = Digest::MD5.hexdigest(@name)
      prefix_lengths = Array.new
      @lengths.each_with_index { |length, index|
        prefix_lengths << hashed.slice(index, length)
      }
      prefix_lengths
    end

    def podpath
      path = ''
      shard.map { |hex|
        path << hex.to_s << '/'
      }
      path
    end

  end
end
