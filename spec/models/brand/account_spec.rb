require 'rails_helper'

RSpec.describe Brand::Account, type: :model do
  describe 'relations' do
    let(:brand_account) do
      build_stubbed(
        :brand_account,
        brand_members: [
          build_stubbed(:brand_member)
        ]
      )
    end

    it { expect(brand_account.brand_members.length).to be >= 1 }
  end
end
