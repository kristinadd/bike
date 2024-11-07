require 'rails_helper'

RSpec.describe Ride, type: :model do
  # Eagerly evaluated —> created immediately before each test.
  let!(:start_city) {FactoryBot.create(:city, name: "a")}
  let!(:end_city)  {FactoryBot.create(:city, name: "b")}
  let!(:ride) {FactoryBot.create(:ride, start_city: start_city, end_city: end_city, name: "Morning commute")}

  let!(:ride_with_large_distance) {FactoryBot.create(:ride, :large_distance, start_city: start_city, end_city: end_city, name: "Long Morning commute")}

  it 'creates a valid record' do
    expect(ride).to be_valid
    # be_valid is used for ActiveRecord objects
  end

  it 'has valid name' do
    expect(ride.name).to eq("Morning commute")
    expect(ride.name).to be_a(String)
    expect(ride.name).to include("Morning")
    expect(ride.name).to start_with("Morning")
    expect(ride.name).to end_with("commute")
    expect(ride.name).to match(/commute/)
    expect(ride.name).to match(/morning/i)
  end

  it 'has valid recommendation' do
    expect(ride.recommendation).to be_a(Hash)
  end

  it 'has valid distance' do
    expect(ride.distance).to be_a(Integer)
    expect(ride.distance).to be > 0
  end

  it 'has valid start city' do
    expect(ride.start_city).to eq(start_city)
  end

  it 'has valid end city' do
    expect(ride.end_city).to eq(end_city)
  end

  it 'creates a valid record with large distance' do
    expect(ride_with_large_distance).to be_valid
  end

  it 'has large distance' do
    expect(ride_with_large_distance.distance).to eq(10000)
  end
end
