require 'thor'
require 'podspecdolly/shard'
require 'podspecdolly/dependencies'
require 'podspecdolly/podspec_getter'

module Podspecdolly
  class Interface < Thor
    package_name 'podspecdolly'
    desc "clone PODFILE SHARD_LENGTH", "clone the pods from PODFILE with SHARD_LENGTH"
    def clone(podfile = 'podfile', shard_length = [1,1,1])
      @podfile = Dir::glob(podfile).first
      pods = Dependencies.new(@podfile).validate
      if pods.count == 0
        p "Couldn't find any valid pod declaration in #{@podfile.to_s}"
        abort
      else
        pods.each do |pod|
          p 'Checking up for pod ' << pod
          podpath = Shard.new(pod, shard_length).podpath
          requester = Podspec_getter.new(pod,podpath)
          requester.request
        end
      end
    end

  end
end
