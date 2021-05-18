class Brand::Member < ApplicationRecord
  belongs_to :user_account
  belongs_to :brand_account, class_name: 'Brand::Account'
end
