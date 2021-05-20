require 'rails_helper'

RSpec.describe Auth0::User::Create, type: :service do
  let(:created_user) { Auth0::User::Create.process('wazo@yahoo.fr') } 
  
  describe 'user_id' do
    it 'should return a user_id' do
      expect(created_user[:user_id]).not_to be nil
    end

    it 'should be a string' do
      expect(created_user[:user_id]).to be_a(String)
    end
  end
end