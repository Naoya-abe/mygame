class Game < ApplicationRecord
  validates :jancode, presence: true, length: {maximum: 255}
  validates :title, presence: true, length: {maximum: 255}
  validates :url, presence: true, length: {maximum: 255}
  validates :image_url, presence: true, length: {maximum: 255}
end
