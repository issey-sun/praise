class Like < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  # belongs_to :p_answer

  validates_uniqueness_of :answer_id, scope: :user_id

end
