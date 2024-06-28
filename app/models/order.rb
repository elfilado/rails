class Order < ApplicationRecord
  belongs_to :product
  belongs_to :buyer
  before_validation :set_total_price
  validates :quantity, :total_price, presence: true
  
  private
  def set_total_price
    self.total_price = product.price * quantity
  end
end
