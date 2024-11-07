require 'rails_helper'

RSpec.describe 'User Factory' do
let!(:user) { create(:user)}
  it 'creates a valid user' do
    expect(user).to be_valid
  end
end
   