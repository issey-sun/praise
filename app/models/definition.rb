class Definition < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
