require 'rails_helper'

RSpec.describe Reaction, type: :model do
  let!(:reaction) { create(:reaction, reaction_type: 'love') }

  it 'creates a valid record' do
    expect(reaction).to be_valid
  end

  it 'has valid reaction_type' do
    expect(Reaction::ALLOWED_REACTION_TYPES).to include( reaction.reaction_type)
  end

  it 'is invalid record with an incorrect reaction_type' do
    invalid_reaction = build(:reaction, reaction_type: 'invalid_type')
    expect(invalid_reaction).not_to be_valid
    expect(invalid_reaction.errors[:reaction_type]).to include("is not included in the list")
    expect(Reaction::ALLOWED_REACTION_TYPES).to_not include( invalid_reaction.reaction_type)
  end

  it 'is invalid if the user reacts to the same ride more than once' do
    first_reaction = create(:reaction, reaction_type: 'love')
    duplicate_reaction = build(:reaction, reaction_type: 'celebrate', user: first_reaction.user, ride: first_reaction.ride)
  
    expect(duplicate_reaction).not_to be_valid
    expect(duplicate_reaction.errors[:user_id]).to include('has already been taken')
  end 

  it 'is invalid without a user' do
    reaction_without_user = build(:reaction, user: nil)
    expect(reaction_without_user).not_to be_valid
    expect(reaction_without_user.errors[:user]).to include("must exist")
  end
  
  it 'is invalid without a ride' do
    reaction_without_ride = build(:reaction, ride: nil)
    expect(reaction_without_ride).not_to be_valid
    expect(reaction_without_ride.errors[:ride]).to include("must exist")
  end
  
  it 'belongs to a user' do
    association = Reaction.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end
  
  it 'belongs to a ride' do
    association = Reaction.reflect_on_association(:ride)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'destroys reactions when the ride is destroyed' do
    ride = create(:ride)
    create(:reaction, ride: ride)
    
    expect { ride.destroy }.to change { Reaction.count }.by(-1)
  end
  
  it 'destroys reactions when the user is destroyed' do
    user = create(:user)
    create(:reaction, user: user)
  
    expect { user.destroy }.to change { Reaction.count }.by(-1)
  end
end
