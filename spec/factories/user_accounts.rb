FactoryBot.define do
  factory :user_account do
    email { ::FFaker::Internet.email }
    auth0_uid { SecureRandom.uuid }
  end
end
