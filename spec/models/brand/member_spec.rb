require 'rails_helper'

RSpec.describe Brand::Member, type: :model do
  describe 'relations' do
    let(:brand_member) do
      build_stubbed(
        :brand_member,
        user_account: create(:user_account)
      )
    end

    it { expect(brand_member.user_account).not_to be nil }
    it { expect(brand_member.brand_account).not_to be nil }
  end
end
