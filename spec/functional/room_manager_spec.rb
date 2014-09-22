require "spec_helper"

describe RoomBooking::RoomManager do 

  it "able to request payment with room's creadit card without error" do
    room = RoomBooking::Room.new({:number => 1, :floor => 1, :building => 1})
    cc_info = room.get_cc_info
    room = RoomBooking::RoomManager.request_payment(cc_info, 10)
  end

end