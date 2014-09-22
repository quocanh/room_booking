require "spec_helper"

describe RoomBooking::Room do 

  it 'fail checkout if timeout' do
    room = RoomBooking::Room.new({:number => 1, :floor => 1, :building => 1})
    room.change_status('occupied')
    room.add_balance(100.0)
    cc_info = room.get_cc_info
    expect(RoomBooking::RoomManager).to receive(:request_payment).and_return("timeout")
    result = room.checkout
    expect(result).not_to eq('OK')
  end

  it 'able to do checkout' do
    room = RoomBooking::Room.new({:number => 1, :floor => 1, :building => 1})
    room.change_status('occupied')
    room.add_balance(100.0)
    cc_info = room.get_cc_info
    expect(RoomBooking::RoomManager).to receive(:request_payment).and_return("approved")
    result = room.checkout
    expect(result).to eq('OK')
  end

end