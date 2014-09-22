module RoomBooking

  class Room
    attr_accessor :number, :floor, :building

    def initialize(option)
      [:number, :floor, :building].each {|k| 
        raise "key #{k} is required" unless option.key? k and option[k]
      }

      @number = option[:number]
      @floor = option[:floor]
      @building = option[:building]
      @status = option[:status] if option[:status]
      @balance = 0
    end

    def get_status
      @status
    end

    def change_status(status)
      # Change status, but not from occupied to free
      @status = status unless @status == 'occupied' and status == 'free'
    end

    def balance
      @balance
    end

    def add_balance(amount)
      @balance += amount
    end

    def get_cc_info
      # TODO: implement code to get cc info from user
      # stub for now
      {:number => '4444333322221111', :expire_date => '2015-04', :ccv => '123'}
    end

    def checkout
      if @balance == 0 then 
        @status = 'free'
        return "OK"
      end
      response = RoomManager.request_payment(get_cc_info, @balance)
      if response == 'approved' then
        @status = 'free'
        @balance = 0
        return "OK"
      else
        return "balance not paid"
      end
    end

  end
end