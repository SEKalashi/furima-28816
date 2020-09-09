class OrderSale

  include ActiveModel::Model
  attr_accessor :postal_code, :house_number, :telephone_number, :address, :house_name, :prefecture_id, :token, :user_id, :item_id

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :prefecture_id
  end

  with_options presence: true do
    validates :postal_code, :house_number
    validates :telephone_number, format: { with: /\d/, message: 'is invalid. Input half-width integer.' }
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Sale.create(order_id: order.id, postal_code: postal_code, house_number: house_number, telephone_number: telephone_number, address: address, house_name: house_name, prefecture_id: prefecture_id)
  end

end