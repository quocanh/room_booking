require "spec_helper"

describe RoomBooking::Room do 
  it 'error to inititalize without input data' do
    expect{RoomBooking::Room.new()}.to raise_error
  end

  it 'error to inititalize without "number" key' do
    expect{RoomBooking::Room.new({:floor => 1, :building => 1})}.to raise_error
  end

  it 'error to inititalize without "floor" key' do
    expect{RoomBooking::Room.new({:number => 1, :building => 1})}.to raise_error
  end

  it 'error to inititalize without "building" key' do
    expect{RoomBooking::Room.new({:number => 1, :floor => 1})}.to raise_error
  end

  it 'error to inititalize with nil value' do
    expect{RoomBooking::Room.new({:number => nil, :floor => 1, :building => 1})}.to raise_error
  end

  it 'able to inititalize with required keys' do
    room = RoomBooking::Room.new({:number => 1, :floor => 1, :building => 1})
  end

  it 'able to change status' do
    room = RoomBooking::Room.new({:number => 1, :floor => 1, :building => 1})
    room.change_status('booked')
    expect(room.get_status).to eq('booked')
  end

end