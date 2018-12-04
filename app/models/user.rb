class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :favorites
  has_many :likes , through: :favorites, source: :post
  
  
  def like(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end
  
  def unlike(post)
    favorite=self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def liking?(post)
    self.likes.include?(post)
  end
end
