class Brand::Account < ApplicationRecord
  belongs_to :brand_company, class_name: 'Brand::Company'
  has_many :brand_members, class_name: 'Brand::Member', foreign_key: :brand_account_id
  validates :siret_number, :label, presence: true
end
