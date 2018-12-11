class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # attr_accessor :email, :password, :remember_me, :image, :image_cache, :remove_image
  
  validates_presence_of   :image
  validates_integrity_of  :image
  validates_processing_of :image
  
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
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
