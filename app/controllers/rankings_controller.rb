class RankingsController < ApplicationController
  def favorite
    @favorite_counts=Favorite.ranking
    @posts=Post.find(@favorite_counts.keys)
  end
end
