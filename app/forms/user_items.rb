class UserItems

  include ActiveModel::Model
  attr_accessor :nickname, :first_name, :first_kana, :family_name,
                :family_kana, :birthday, :email, :password,
                :name, :description, :status_id, :shipping_time_id,
                :delivery_charge_id, :category_id, :sending_area_id,
                :price, :image,

                with_options presence: true do
                  validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
                  validates :first_kana, :family_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
                  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'is invalid. Input half-width integer and half-width string characters.' }
                  validates :nickname, :birthday
                end
              
                  with_options numericality: { other_than: 1, message: 'Select' } do
                    validates :status_id
                    validates :shipping_time_id
                    validates :delivery_charge_id
                    validates :category_id
                    validates :sending_area_id
                  end
                
                  with_options presence: true do
                    validates :name, :description
                    validates :price, format: { with: /\d/, message: "is invalid. Input half-width integer."}
                    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
                  end

                  def save
                    # ユーザーの情報を保存し、「user」という変数に入れている
                    user = User.create(nickname: nickname, first_name: first_name, first_kana: first_kana, family_name: family_name, family_kana: family_kana, birthday: birthday, email: email, password: password)
                    # 商品の情報を保存
                    Item.create(name: name, description: description, status_id: status_id, shipping_time_id: shipping_time_id, delivery_charge_id: delivery_charge_id, category_id: category_id, sending_area_id: sending_area_id, price: price, user_id: user.id)
                    # 商品画像の情報を保存
                    Image.create(image: image, user_id: user.id)
                  end
end