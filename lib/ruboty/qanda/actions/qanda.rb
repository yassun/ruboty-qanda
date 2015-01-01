module Ruboty
  module Qanda
    module Actions
      class Qanda < Ruboty::Actions::Base
        DOCOMO_QANDA_API_URL = "https://api.apigw.smt.docomo.ne.jp/knowledgeQA/v1/ask"

        def initialize(message)
          @message = message
        end

        def call
          message.reply(qanda)
        end

        private

        def qanda
          response.body["message"]["textForDisplay"]
        end

        def response
          connection.get(url, params)
        end

        def connection
          Faraday.new do |connection|
            connection.request  :url_encoded
            connection.adapter  :net_http
            connection.response :json
          end
        end

        def url
          DOCOMO_QANDA_API_URL
        end

        def params
          {
            APIKEY: ENV["DOCOMO_API_KEY"],
            q: @message[:keyword]
          }
        end
      end
    end
  end
end
