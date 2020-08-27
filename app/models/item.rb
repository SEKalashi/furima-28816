class Item < ApplicationRecord
  has_many :images
  belong_to :user

  with_options presence: true do
    validates :price, format: { with: /\d/, message: "is invalid. Input half-width integer."}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end
end
