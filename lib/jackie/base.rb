module Jackie
  class Base < ActiveResource::Base
    self.site = "https://kickfolio.com/api/"
    headers['Accept'] = 'application/vnd.kickfolio.v1'

    class << self
      def headers
        if defined?(@headers)
          @headers
        elsif superclass != Object && superclass.headers
          superclass.headers
        else
          @headers ||= {}
        end
      end

      def api_key=(api_key)
        headers.merge!({'Authorization' => "Basic #{Base64.strict_encode64(api_key)}"})
      end
    end
  end
end
