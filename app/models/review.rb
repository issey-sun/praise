class Review < ApplicationRecord
  belongs_to :user
  belongs_to :definition

  validates :score, presence: true
  validates_uniqueness_of :definition_id, scope: :user_id

end
