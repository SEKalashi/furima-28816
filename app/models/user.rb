class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
          validates :first_kana, :family_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
          PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX, message: "には英字と数字を両方含めて入力してください。"
          # validates :password, format: { with: /\A[a-z0-9]+\z/i, message: "は半角英数で入力してください。"}
          validates :name, :birthday
        end
end
