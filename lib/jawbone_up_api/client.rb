require 'jawbone_up_api/client/version'
require 'faraday'
require 'json'
require 'hashie'

module JawboneUPAPI
  class Client
    API_VERSION = '1.1'
    BASE_URL  = "https://jawbone.com/nudge/api/v.#{API_VERSION}"

    def initialize(token)
      @token = token

      @conn = Faraday.new() do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end

      @conn.authorization(:Bearer, @token)
    end

    def sleeps(date = nil)
      if date != nil
        param = {date: date}
      end
      json = get_helper('users/@me/sleeps', param: param)
      Hashie::Mash.new(json)
    end

    private

    def get_helper(path, param: nil)
      response = @conn.get("#{BASE_URL}/#{path}", param)

      if response.body != nil
        JSON.parse(response.body)
      end
    end
  end
end