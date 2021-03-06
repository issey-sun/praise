module NotificationsHelper
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
  
  def notification_form(notification)
    #通知を送ってきたユーザーを取得
    @visitor = notification.visitor
    #コメントの内容を通知に表示する
    @answer = nil
    @p_answer = nil
    @visitor_answer = notification.answer_id
    @visitor_p_answer = notification.p_answer_id
    case notification.action
    
    when 'follow' then
      #aタグで通知を作成したユーザーshowのリンクを作成
      tag.a(notification.visitor.nickname, href: user_path(@visitor)) + 'があなたをフォローしました'
    
    when 'like' then
      tag.a(notification.visitor.nickname, href: user_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: definition_path(notification)) + 'にいいねしました'
   
    when 'p_like' then
      tag.a(notification.visitor.nickname, href: user_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: p_definition_path(notification)) + 'にいいねしました'

    when 'review' then
      tag.a(notification.visitor.nickname, href: user_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: new_definition_review_path(notification)) + 'を評価しました'

    when 'p_review' then
      tag.a(notification.visitor.nickname, href: user_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: new_p_definition_p_review_path(notification)) + 'を評価しました'


    when 'answer' then
      #コメントの内容と投稿のタイトルを取得      
      @answer = Answer.find_by(id: @visitor_answer)
      @answer_content =@answer.answer
      @definition_title =@answer.definition.title
      tag.a(@visitor.nickname, href: user_path(@visitor)) + 'が' + tag.a("#{@definition_title}", href: definition_path(notification.definition_id)) + 'に回答しました'
    

    when 'p_answer' then
      #コメントの内容と投稿のタイトルを取得      
      @p_answer = PAnswer.find_by(id: @visitor_p_answer)
      @p_answer_content =@p_answer.answer
     @p_definition_title =@p_answer.p_definition.title
      tag.a(@visitor.nickname, href: user_path(@visitor)) + 'が' + tag.a("#{@p_definition_title}", href: p_definition_path(notification.p_definition_id)) + 'に回答しました'
  
  end
 end
end
