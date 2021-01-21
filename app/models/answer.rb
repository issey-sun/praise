class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :definition
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy


  validates :answer, presence: true

 
end
