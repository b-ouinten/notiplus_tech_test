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
    @trigger.auth0_user = created_user['user_id']
  end
  
  describe 'create UserAccount' do
    it 'should create an instance of UserAccount' do
      expect(@trigger.send(:user)).to be_a UserAccount
    end
  end

  describe 'create BrandCompany' do
    it 'should create an instance of BrandCompany' do
      @trigger.siret_lookup = siret_lookup_response
      expect(@trigger.send(:company)).to be_a Brand::Company
    end
  end
end