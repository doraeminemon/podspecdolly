#https://api.github.com/repos/CocoaPods/Specs/contents/Specs/#{pod}
require 'unirest'
require 'json'
require 'fileutils'
module Podspecdolly
  class Podspec_getter
    def initialize(podname, pod_path)
      @podname = podname
      @pod_path = pod_path
    end

    def request
      url = "https://api.github.com/repos/CocoaPods/Specs/contents/Specs/#{@pod_path}#{@podname}"
      pod_response = Unirest.get( url , headers: {"Accept" => "application/json"})
      check_responsecode_success(pod_response,"URL to Cocoapod spec with #{@podname} is invalid. Check pod name again ?")
      pod_object = pod_response.body
      if pod_object.kind_of?(Array)
        FileUtils::mkdir_p "./Specs/#{@podname}"
        pod_object.each do |version|
          version_name = version['name']
          url = version['url']
          unless File.directory?("./Specs/#{@podname}/#{version_name}")
            FileUtils::mkdir_p "./Specs/#{@podname}/#{version_name}"
            version_response = Unirest.get url
            check_responsecode_success(version_response, "Request for version #{version_name} failed.")
            version_object = version_response.body
            if version_object.kind_of?(Array)
              version_object.each do |object|
                object_name = object['name']
                object_downloadurl = object['download_url']
                podspec_response = Unirest.get object_downloadurl
                File.open("./Specs/#{@podname}/#{version_name}/#{object_name}", 'w') do |f|
                  f.puts podspec_response
                end
              end
            end
          end
        end
      end
    end

    def check_responsecode_success(response, message)
      unless response.code.between?(200,299)
        p message
        p response.body
        abort
      end
    end

  end
end
