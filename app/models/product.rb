class Product < ApplicationRecord
  has_one_attached :product_picture
  belongs_to :user
  belongs_to :category
  has_many :reviews

  validates :name, :description, :price, :category_id, :user_id, presence: true
  validates :name, length:{ minimum: 5}
  validates :price, numericality: true
end
