class PReview < ApplicationRecord
  belongs_to :user
  belongs_to :p_definition

  validates :score, presence: true
end
