class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  belongs_to :definition
  belongs_to :p_answer
  belongs_to :p_definition


  validates :comment, presence: true
end
