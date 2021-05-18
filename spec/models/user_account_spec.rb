require 'rails_helper'

RSpec.describe UserAccount, type: :model do
  describe 'missing auth0_uid' do
    let(:user) { build_stubbed(:user_account, auth0_uid: nil) }

    it { expect(user.valid?).to be false }
  end

  describe 'relations' do
    let(:user) do
      create(
        :user_account,
        brand_member: create(:brand_member)
      )
    end

    it { expect(user.brand_member).not_to be nil }
    it { expect(user.brand_account).not_to be nil }
    it { expect(user.brand_company).not_to be nil }
  end
end
