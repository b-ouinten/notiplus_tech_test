require 'rails_helper'

RSpec.describe Signup::Trigger, type: :service do
  include_context 'auth0'
  include_context 'actions'

  let(:user_params) {{ 
    email: FFaker::Internet.email,
    siret: SecureRandom.uuid
  }}

  before :each do
    @trigger = Signup::Trigger.new(user_params)
    @trigger.auth0_user_id_mock = created_user['user_id']
    @trigger.siret_lookup_mock = siret_lookup_response
  end
  
  describe 'user method' do
    it 'should create an instance of UserAccount when user_id is provided' do
      user_account = @trigger.send(:user)
      expect(user_account).to be_a UserAccount
      expect(user_account).to be_valid
    end
    
    it 'should raise error if user_id is empty' do
      @trigger.auth0_user_id_mock = nil
      expect{ @trigger.send(:user) }.to raise_error(Signup::Exception, 'user_id is empty!')
    end
  end
  
  describe 'company method' do
    it 'should create an instance of BrandCompany when ape_code is valid' do
      company = @trigger.send(:company)
      expect(company).to be_a Brand::Company
      expect(company).to be_valid
    end

    it 'should raise error if ape_code is not valid' do
      @trigger.siret_lookup_mock[:uniteLegale][:periodesUniteLegale][0][:activitePrincipaleUniteLegale] = '68.10Z'
      expect{ @trigger.send(:company) }.to raise_error(Signup::Exception, 'ape_code is invalid!')
    end
  end

  describe 'account method' do
    it 'should create an instance of BrandAccount' do
      account = @trigger.send(:account)
      expect(account).to be_a Brand::Account 
      expect(account).to be_valid 
    end
  end

  describe 'member method' do
    it 'should create an instance of BrandMember' do
      member = @trigger.send(:member)
      expect(member).to be_a Brand::Member
      expect(member).to be_valid
    end
  end
end