class PLike < ApplicationRecord
  belongs_to :user
  belongs_to :p_answer

  validates_uniqueness_of :p_answer_id, scope: :user_id
end
