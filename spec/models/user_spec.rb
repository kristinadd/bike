require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user, 
    name: "My name", 
    email: "myemail@email.com", 
    password: "password", 
    password_confirmation: "password")}
# build instantiates the object without saving it to the database, allowing you to test its validity without triggering the uniqueness constraint immediately.
  let!(:invalid_user) { build(:user, name: "AAA", email: user.email) } # create tries to save the record emediatly and it trigers the validation way before the test

    describe 'validations' do
    it 'creates a valid user' do
      expect(user).to be_valid
    end

    it "is invalid without an 'email'" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is invalid with a duplicate email' do
      expect(invalid_user).not_to be_valid # triger the validation manually
      expect(invalid_user.errors[:email]).to include('has already been taken')
    end

    it 'is invalid with an incorrectly formatted email' do
      user.email = 'invalid_email'
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include('is invalid')
    end
  end

  describe 'associations' do
    it 'has many rides' do
      expect(User.reflect_on_association(:rides).macro).to eq(:has_many)
    end

    it 'has many reactions' do
      expect(User.reflect_on_association(:reactions).macro).to eq(:has_many)
    end

    it 'destroys dependent rides when user is deleted' do
      ride = create(:ride, user: user)
      expect { user.destroy }.to change { Ride.count }.by(-1)
    end

    it 'destroys dependent reactions when user is deleted' do
      reaction = create(:reaction, user: user)
      expect { user.destroy }.to change { Reaction.count }.by(-1)
    end
  end
end
