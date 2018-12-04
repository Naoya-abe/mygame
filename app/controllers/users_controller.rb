class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @posts=@user.posts.order('created_at DESC')
  end
  
 def likes
   @user=User.find(params[:id])
   @likes=@user.likes
 end
  
end
