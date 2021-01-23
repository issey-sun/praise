class Review < ApplicationRecord
  belongs_to :user
  belongs_to :definition

  validates :score, presence: true
end
