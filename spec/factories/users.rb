FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    first_name {'太郎'}
    first_kana {'タロウ'}
    family_name {'山田'}
    family_kana {'ヤマダ'}
    birthday {'1/1'}
  end
end
