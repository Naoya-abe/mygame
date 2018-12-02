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
  end

  def edit
  end

  def update
  end
  
  private
  
  def post_params
     params.require(:post).permit(:impression, :game_id)
  end
  
end
