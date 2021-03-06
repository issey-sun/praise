class Review < ApplicationRecord
  belongs_to :user
  belongs_to :definition

  validates :user_id, presence: true
  validates :definition_id, presence: true
  validates :score, presence: true
  validates_uniqueness_of :definition_id, scope: :user_id
end
