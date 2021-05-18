class Brand::Company < ApplicationRecord
  belongs_to :owner, class_name: 'UserAccount'
  has_many :brand_accounts, class_name: 'Brand::Account', foreign_key: :brand_company_id
  has_many :brand_members, through: :brand_accounts, class_name: 'Brand::Member'
  has_many :user_accounts, through: :brand_members
  validates :siren_number, :label, presence: true
end
