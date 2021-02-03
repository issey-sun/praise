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
  has_one_attached :image
  belongs_to_active_hash :sex


  # フォロー取得
  has_many :follower, class_name: 'Relationship', inverse_of: :follower, foreign_key: 'follower_id', dependent: :destroy
  # フォロワー取得
  has_many :followed, class_name: 'Relationship', inverse_of: :followed, foreign_key: 'followed_id', dependent: :destroy

  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  #通知
  has_many :active_notifications, foreign_key:"visitor_id", class_name: "Notification", dependent: :destroy
  has_many :passive_notifications, foreign_key:"visited_id", class_name: "Notification", dependent: :destroy

  
  validates :nickname, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
  validates :birth_day, presence: true
  validates :image, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
  validates :sex_id
  end

  def already_liked?(answer)
    self.likes.exists?(answer_id: answer.id)
  end

  def already_p_liked?(p_answer)
    self.p_likes.exists?(p_answer_id: p_answer.id)
  end





# ユーザーをフォローする
def follow(user_id)
  follower.create(followed_id: user_id)
end

# ユーザーのフォローを外す
def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
end

# フォローしていればtrueを返す
def following?(user_id)
  following_user.include?(user_id)
end

# 最近作成されたユーザーから表示
default_scope -> { order(created_at: :desc) }
# 一度に表示する投稿数
paginates_per 8

 # # 簡単ログイン：ユーザー作成
#  def self.guest
#   image_path = open('./db/fixtures/guest/user.png')
#   find_or_create_by!(email: 'guest@sample.com') do |user|
#     user.password = SecureRandom.urlsafe_base64
#     user.name = 'guest_user'
#     user.image = image_path
#     user.confirmed_at = Time.zone.now # Confirmable を使用している場合は必要
#   end
# end


#notification フォロー
def create_notification_follow!(current_user)
  #すでに通知が作成されているか確認
  temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
  if temp.blank?
    notification = current_user.active_notifications.new(
      visited_id: id,
      action: 'follow'
    )
    notification.save if notification.valid?
  end
end


end