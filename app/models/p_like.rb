class PLike < ApplicationRecord
  belongs_to :user
  belongs_to :p_answer
  belongs_to :p_definition

  validates_uniqueness_of :p_answer_id, scope: :user_id
  validates_uniqueness_of :p_definition_id, scope: :user_id

end
