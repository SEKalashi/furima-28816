class Item < ApplicationRecord
  has_many :images
  belong_to :user
end
