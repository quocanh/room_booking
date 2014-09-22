require "spec_helper"

describe RoomBooking::RoomManager do 

  it 'able to request payment without error' do
    cc_info = {:number => '4444333322221111', :expire_date => '2015-04', :ccv => '123'}
    room = RoomBooking::RoomManager.request_payment(cc_info, 10)
  end

  it 'ensure RoomManager to have requester_id' do
    expect(RoomBooking::RoomManager.requester_id).not_to be_nil
  end

end