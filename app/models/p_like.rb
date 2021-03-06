class PLike < ApplicationRecord
  belongs_to :user
  belongs_to :p_answer
  belongs_to :p_definition

  validates :user_id, presence: true
  validates :p_answer_id, uniqueness: { scope: :user_id }, presence: true
  validates :p_definition_id, uniqueness: { scope: :user_id }, presence: true
end
