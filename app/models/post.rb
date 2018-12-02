class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  validates :impression, presence: true, length: {maximum: 255}
end
