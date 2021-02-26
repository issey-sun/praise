class Like < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  belongs_to :definition

  # validates_uniqueness_of :answer_id, scope: :user_id
  # validates_uniqueness_of :definition_id, scope: :user_id


end
