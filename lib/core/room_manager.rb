module RoomBooking

  class RoomManager
    
    def self.request_payment(credit_card, amount, timeout=30)
      url = "https://to_be_defined"
      [:number, :expire_date, :ccv].each {|k| 
        raise "key #{k} is required" unless credit_card.key? k
      }
      raise "Amount must be positive" unless amount and amount > 0.0

      # TODO: post to credit authorization and get response
      return "rejected"
    end

    def self.requester_id
      '123456789'
    end

  end
end