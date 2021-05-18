require 'rails_helper'

RSpec.describe Brand::Company, type: :model do
  describe 'relations' do
    let(:brand_company) do
      create(
        :brand_company,
        brand_accounts: [
          create(
            :brand_account,
            brand_members: [
              create(:brand_member)
            ]
          )
        ]
      )
    end

    it { expect(brand_company.brand_accounts.length).to be >= 1 }
    it { expect(brand_company.brand_members.length).to be >= 1 }
    it { expect(brand_company.user_accounts.length).to be >= 1 }
  end
end
