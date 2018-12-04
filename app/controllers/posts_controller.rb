class PostsController < ApplicationController
  
  def new
    @game=Game.find_or_initialize_by(jancode: params[:jancode])
    unless @game.persisted?
      results=RakutenWebService::Books::Game.search(jan: @game.jancode)
      @game = Game.new(read(results.first))
      @game.save
    end
    @post=@game.posts.build
  end
  
  def create
    @post=current_user.posts.build(post_params)
    if @post.save
      flash[:success]='メッセージを投稿しました。'
      redirect_to root_url
    else
      @game = Game.find_by(id: @post.game_id) 
      flash.now[:danger]='メッセージの投稿に失敗しました。'
      render 'posts/new'
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    
    flash[:success] = "投稿は正常に削除されました。"
    redirect_to root_url
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      flash[:success]='投稿を編集しました。'
      redirect_to root_url
    else
      flash.now[:danger]='投稿の編集に失敗しました。'
      render 'posts/edit'
    end
  end
  
  private
  
  def post_params
     params.require(:post).permit(:impression, :game_id)
  end
  
end
