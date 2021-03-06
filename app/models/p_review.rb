class PReview < ApplicationRecord
  belongs_to :user
  belongs_to :p_definition

  validates :user_id, presence: true
  validates :p_definition_id, presence: true
  validates :score, presence: true
  validates_uniqueness_of :p_definition_id, scope: :user_id
end
