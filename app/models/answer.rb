class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :definition
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy


  validates :answer, presence: true


   #notification
   def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and answer_id = ? and action = ? ",
                                  current_user.id, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        answer_id: id,
        visited_id: user_id,
        action: 'like'
      )

      if notification.visitor_id == notification.visited_id
         notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
 
end
