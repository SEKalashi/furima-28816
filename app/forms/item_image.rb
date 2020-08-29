class ItemImage
  include ActiveModel::Model
  attr_accessor :item_id, :name, :description, :status_id, :shipping_time_id, :delivery_charge_id, :category_id, :sending_area_id, :price, :image


  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :status_id
    validates :shipping_time_id
    validates :delivery_charge_id
    validates :category_id
    validates :sending_area_id
  end

  with_options presence: true do
    validates :name, :description
    validates :price, format: { with: /\d/, message: 'is invalid. Input half-width integer.' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end

  def save
    # 商品の情報を保存
    Item.create(name: name, description: description, status_id: status_id, shipping_time_id: shipping_time_id, delivery_charge_id: delivery_charge_id, category_id: category_id, sending_area_id: sending_area_id, price: price)
    # 商品画像の情報を保存
    Image.create(image: image, item_id: item.id)
  end
end
