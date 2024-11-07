require 'rails_helper'

RSpec.describe Ride, type: :model do
# Eagerly evaluated —> created immediately before each test.
let!(:city) { FactoryBot.create(:city, name: "San Francisco") }


  it 'creates a valid record' do
    expect(city).to be_valid
  end

  it 'has a valid name' do
    expect(city.name).to eq("San Francisco")
    expect(city.name).to be_a(String)
    expect(city.name).to include("San")
    expect(city.name).to start_with("San")
    expect(city.name).to end_with("Francisco")
  end
end
