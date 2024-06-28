class User < ApplicationRecord
    has_secure_password
    has_one :buyer
    has_one :seller
    after_create :create_buyer
    validates :email, presence: true, uniqueness: true

    def create_seller
      Seller.create(user: self)
    end

    def seller?
      seller.present?
    end

    private
    def create_buyer
      Buyer.create(user: self)
    end
end
  