class Sale < ApplicationRecord
  belongs_to :order

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture

  # with_options numericality: { other_than: 0, message: 'Select' } do
  #   validates :prefecture_id
  # end

  # with_options presence: true do
  #   validates :postal_code, :house_number
  #   validates :telephone_number, format: { with: /\d/, message: 'is invalid. Input half-width integer.' }
  #   validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
  # end
end
