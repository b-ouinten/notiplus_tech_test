module Signup
  class Trigger < ApplicationService
    attr_writer :siret_lookup, :auth0_user
    
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
      Brand::Company.create(
        owner: user,
        siren_number: @params[:siret] && @params[:siret].slice(0, 9),
        label: siret_lookup.dig('uniteLegale', 'periodesUniteLegale', 'nomUniteLegale')
      )
    end

    def ape_code
      # Précision action spécifique :
      # -> siret_lookup.dig('uniteLegale', 'periodesUniteLegale', 'activitePrincipaleUniteLegale')
    end

    def siret_lookup
      @siret_lookup ||= ::Siret::Lookup.process(@params[:siret])
    end

    def auth0_user_id
      @auth0_user ||= ::Auth0::User::Create.process(
        @params[:email],
        @params[:password]
      )['user_id']
    end
  end
end
