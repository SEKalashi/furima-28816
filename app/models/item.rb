class Item < ApplicationRecord
  has_many :images
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status, :shipping_time, :delivery_charge, :category, :sending_area,


  #ジャンルの選択が「--」の時は保存できないようにする
  validates :status_id, :shipping_time_id, :delivery_charge_id, :category_id, :sending_area_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :name, :description
    validates :price, format: { with: /\d/, message: "is invalid. Input half-width integer."}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end
end
