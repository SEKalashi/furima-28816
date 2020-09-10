FactoryBot.define do
  factory :order_sale do
    postal_code      { '123-4567' }
    prefecture_id    { '1' }
    address          { 'さいたま市' }
    house_number     { '1-2-3' }
    house_name       { 'テストマンション' }
    telephone_number { '08012345678' }
  end
end
