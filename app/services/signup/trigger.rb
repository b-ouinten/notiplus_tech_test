module Signup
  class Trigger < ApplicationService
    attr_accessor :siret_lookup_mock, :auth0_user_id_mock
    
    def initialize(params)
      @params = params
    end

    def process
    end

    private

    def user
      UserAccount.create(
        email: @params[:email],
        phone_number: @params[:phone_number],
        first_name: @params[:first_name],
        last_name: @params[:last_name],
        auth0_uid: auth0_user_id
      )
    end

    def company
      # use the exception type to manage exception in controllers
      raise Signup::Exception.new(msg: 'ape_code is invalid!', type: 'ape_code') if not ape_code_valid? 

      Brand::Company.create(
        owner: user,
        label: siret_lookup.dig(:uniteLegale, :periodesUniteLegale, 0, :nomUniteLegale),
        siren_number: @params[:siret] && @params[:siret].slice(0, 9)
      )
    end

    def account
      brand_company = company
      Brand::Account.create(
        brand_company: brand_company,
        label: brand_company.label,
        siret_number: @params[:siret]
      )
    end

    def member
      Brand::Member.create(
        
      )
    end
    
    def ape_code_valid?
      ape_code = siret_lookup.dig(:uniteLegale, :periodesUniteLegale, 0, :activitePrincipaleUniteLegale)
      AUTHORIZED_REALTOR_CODES.include?(ape_code) || AUTHORIZED_NOTARY_CODES.include?(ape_code)
    end

    def siret_lookup
      @siret_lookup_mock ||= ::Siret::Lookup.process(@params[:siret])
    end

    def auth0_user_id
      @auth0_user_id_mock ||= ::Auth0::User::Create.process(
        @params[:email],
        @params[:password]
      )['user_id']
    rescue
      # use the exception type to manage exception in controllers
      raise Signup::Exception.new(msg: 'user_id is empty!', type: 'user_id')
    end
  end
end
