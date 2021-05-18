class UserAccount < ApplicationRecord
  validates :auth0_uid, presence: true

  has_one :brand_member, class_name: 'Brand::Member'
  has_one :brand_account, through: :brand_member, class_name: 'Brand::Account'
  has_one :brand_company, through: :brand_account, class_name: 'Brand::Company'
end
