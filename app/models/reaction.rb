class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  validates :user_id, uniqueness: { scope: :ride_id} # This line ensures that a user can only have one reaction per ride. Enforces that the combination of user_id and ride_id must be unique.

  ALLOWED_REACTION_TYPES = %w(love celebrate).freeze

  validates :reaction_type, inclusion: { in: ALLOWED_REACTION_TYPES }, allow_nil: true
end
