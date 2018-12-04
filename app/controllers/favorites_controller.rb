class FavoritesController < ApplicationController
  def create
    post=Post.find(params[:post_id])
    current_user.like(post)
    flash[:success]="お気に入りしました。"
    redirect_to root_path
  end

  def destroy
    post=Post.find(params[:post_id])
    current_user.unlike(post)
    flash[:danger] = "お気に入りを削除しました。"
    redirect_to root_path
  end
end
