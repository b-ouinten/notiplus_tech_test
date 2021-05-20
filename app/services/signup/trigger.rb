module Signup
  class Trigger < ApplicationService
    attr_writer :siret_lokup, :auth0_uid
    
    def initialize(params)
      @params = params
    end

    def process
      user
    end

    private

    def user
      UserAccount.create(
        email: @params[:email],
        phone_number: @params[:phone_number],
        first_name: @params[:firt_name],
        last_name: @params[:last_name],
        auth0_uid: auth0_user_id
      )
    end

    def company
      # Précision champ spécifique :
      #
      # Brand::Company.create(
      #   ...,
      #   label: siret_lookup.dig('uniteLegale', 'periodesUniteLegale', 'nomUniteLegale')
      # )
    end

    def ape_code
      # Précision action spécifique :
      # -> siret_lookup.dig('uniteLegale', 'periodesUniteLegale', 'activitePrincipaleUniteLegale')
    end

    def siret_lookup
      # @siret_lookup ||= ::Siret::Lookup.process(...)
    end

    def auth0_user_id
      @auth0_user ||= ::Auth0::User::Create.process(
        @params[:email],
        @params[:password]
      )[:user_id]
    end
  end
end
