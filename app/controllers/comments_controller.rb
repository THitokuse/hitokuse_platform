class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: params[:text], product_id: params[:product_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to tweet_path(params[:product_id]) }
      format.json
    end
  end
end
