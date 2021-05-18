class Signup
  class Trigger < ApplicationService
    def initialize(params)
    end

    def process
    end

    private

    def user
      # Précision champ spécifique :
      #
      # UserAccount.create(..., auth0_uid: auth0_user_id)
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
      # @auth0_user ||= ::Auth0::User::Create.process(...)['user_id']
    end
  end
end
