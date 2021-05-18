FactoryBot.define do
  factory :brand_member, class: 'Brand::Member' do
    association :brand_account
    association :user_account
  end
end
