require 'thor'
require 'podspecdolly/shard'
require 'podspecdolly/dependencies'
require 'podspecdolly/podspec_getter'
require 'podspecdolly/shard'

module Podspecdolly
  class Interface < Thor
    desc "clone", "run the cloning podspec process"
    def clone
      @podfile = Dir::glob("podfile").first

      pods = Dependencies.new(@podfile).validate
      pods.each do |pod|
        p 'pod ' << pod
        podpath = Shard.new(pod, [1,1,1]).podpath
        p 'podpath ' << podpath
        requester = Podspec_getter.new(pod,podpath)
        requester.request
      end
    end
  end
end
