module IRKit
  class Device

    attr_reader :addr, :bonjour_name

    def initialize(addr, bonjour_name=nil)
      @addr = addr
      @bonjour_name = bonjour_name
    end

    def get_messages
      res = HTTParty.get("http://#{@addr}/messages")
      case res.code
      when 200
        return nil if res.body.length < 1
        return IRKit::Data.new JSON.parse res.body
      else
        raise IRKit::Error, res.body
      end
    end

    def post_messages(data)
      opts = {
        :body => data
      }
      HTTParty.post "http://#{@addr}/messages", opts
    end

  end
end
