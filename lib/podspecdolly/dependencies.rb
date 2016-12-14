module Podspecdolly
  class Dependencies
    def initialize(podfile)
      @podfile = podfile
    end

    def validate
      pods = Array.new
      File.open(@podfile).each do |line|
        pods << line[/'([^']+)/,0].sub(/'/,'')
      end
      pods
    end



  end
end
