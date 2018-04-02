# require 'addressable'
require 'ipaddr'
require 'json'
require 'net/http'
require 'openssl'
require 'ip2country/railtie' if defined?(Rails)

module IP2COUNTRY
  class V1
    def initialize(ip = false)
      @ip = ip
    end

    def info
      return unless validate(@ip)
      uri = URI("https://api.ip2country.info/ip?#{@ip}")
      Net::HTTP.start(
        uri.host,
        uri.port,
        :use_ssl => true,
        :verify_mode => OpenSSL::SSL::VERIFY_NONE
      ) do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request
        return JSON.parse(response.body)
      end
    end


  

    private

      def validate(ip)
        begin
         raise ArgumentError.new("Invalid IP") unless is_ip?(@ip_address)
        rescue ArgumentError => e
          puts "#{e}"
        end
      end
    
      def is_ip?(ip)
      !!IPAddr.new(ip) rescue false
      end
  end
end

