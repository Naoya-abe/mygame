class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  validates :impression, presence: true, length: {maximum: 255}
  has_many :favorites, dependent: :destroy
  has_many :likeusers, through: :favorites, source: :user
end
