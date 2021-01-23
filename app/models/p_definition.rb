class PDefinition < ApplicationRecord
  belongs_to :user, optional: true
  has_many :p_answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :p_reviews, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  def p_avg_score
    unless self.p_reviews.empty?
      p_reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def p_review_score_percentage
    unless self.p_reviews.empty?
      p_reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end

end
