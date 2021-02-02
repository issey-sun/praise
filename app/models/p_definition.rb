class PDefinition < ApplicationRecord
  belongs_to :user, optional: true
  has_many :p_answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :p_reviews, dependent: :destroy
  has_many :notifications, dependent: :destroy

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

  # 最近作成されたユーザーから表示
default_scope -> { order(created_at: :desc) }
# 一度に表示する投稿数
paginates_per 3


  #notification
  def create_notification_p_answer!(current_user, p_answer_id)
    #同じ投稿にコメントしているユーザーに通知を送る。（current_userと投稿ユーザーのぞく）
    temp_ids = PAnswer.where(p_definition_id: id).where.not("user_id=? or user_id=?", current_user.id,user_id).select(:user_id).distinct
    #取得したユーザー達へ通知を作成。（user_idのみ繰り返し取得）
    temp_ids.each do |temp_id|
      save_notification_p_answer!(current_user, p_answer_id, temp_id['user_id'])
    end
    #投稿者へ通知を作成
    save_notification_p_answer!(current_user, p_answer_id, user_id)
end

def save_notification_p_answer!(current_user, p_answer_id, visited_id)
    notification = current_user.active_notifications.new(
      p_definition_id: id,
      p_answer_id: p_answer_id,
      visited_id: visited_id,
      action: 'p_answer'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
end

# notification review
def create_notification_p_review!(current_user)
  temp = Notification.where(["visitor_id = ? and visited_id = ? and p_definition_id = ? and action = ? ",
                                current_user.id, user_id, id, 'p_review'])
  if temp.blank?
    notification = current_user.active_notifications.new(
      p_definition_id: id,
      visited_id: user_id,
      action: 'p_review'
    )

    if notification.visitor_id == notification.visited_id
       notification.checked = true
    end
    notification.save if notification.valid?
  end
end



end
