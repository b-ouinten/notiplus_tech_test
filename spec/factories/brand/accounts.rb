FactoryBot.define do
  factory :brand_account, class: 'Brand::Account' do
    association :brand_company
    label { ::FFaker::Company.name }
    siret_number { SecureRandom.uuid }
  end
end
