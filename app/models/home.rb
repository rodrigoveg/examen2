class Product < ActiveRecord::Base
  validates :name, :description, presence: true

  belongs_to :category, inverse_of: :products
end
