FactoryBot.define do
  factory :item do
    name               {'テスト商品'}
    description        {'これはテストです。'}
    status_id          {'2'}
    shipping_time_id   {'2'}
    delivery_charge_id {'2'}
    category_id        {'2'}
    sending_area_id    {'2'}
    price              {'300'}
    association :user
  end
end