class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :visitor, class_name: "User", optional: true
  belongs_to :visited, class_name: "User", optional: true
  belongs_to :definition, optional: true
  belongs_to :answer, optional: true
  belongs_to :p_definition, optional: true
  belongs_to :p_answer, optional: true

  
  # validates :visitor_id, presence: true
  # validates :visited_id, presence: true
  # ACTION_VALUES = ["like", "p_like","relationshp", "review","p_review"]
  # validates :action,  presence: true, inclusion: {in:ACTION_VALUES}
  # validates :checked, inclusion: {in: [true,false]}
end
