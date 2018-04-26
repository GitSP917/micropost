class ToppagesController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]
  def index
    if logged_in?
      @user = current_user
      @micropost = current_user.microposts.build
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
    end
  end
end