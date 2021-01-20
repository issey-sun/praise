class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :definitions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :nickname, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
  validates :birth_day, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
  validates :sex_id
  end

end
