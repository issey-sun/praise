class Like < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  belongs_to :definition

  validates :user_id, presence: true
  validates :answer_id, uniqueness: { scope: :user_id }, presence: true
  validates :definition_id, uniqueness: { scope: :user_id }, presence: true
end
