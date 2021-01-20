class Like < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  belongs_to :p_answer

  validates :user_id, presence: true
  validates :answer_id, presence: true
  validates :p_answer_id, presence: true

end
