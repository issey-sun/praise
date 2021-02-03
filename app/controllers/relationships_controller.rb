class RelationshipsController < ApplicationController
  before_action :set_user

  def follow
    # @user =User.find(params[:follow_relationship][:following_id])
    @user =User.find(params[:id])
    #通知機能追加
    current_user.follow(params[:id])
    @user.create_notification_follow!(current_user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def unfollow
    current_user.unfollow(params[:id])
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end


  private

    def set_user
      @user = User.find(params[:id])
    end
end
