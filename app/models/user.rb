class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :definitions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :p_definitions, dependent: :destroy
  has_many :p_answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :p_likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :p_reviews, dependent: :destroy


  
  validates :nickname, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
  validates :birth_day, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
  validates :sex_id
  end

  def already_liked?(answer)
    self.likes.exists?(answer_id: answer.id)
  end

  def already_p_liked?(p_answer)
    self.p_likes.exists?(p_answer_id: p_answer.id)
  end

end
