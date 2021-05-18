FactoryBot.define do
  factory :brand_company, class: 'Brand::Company' do
    association :owner, factory: :user_account
    label { ::FFaker::Company.name }
    siren_number { SecureRandom.uuid }
  end
end
