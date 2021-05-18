# frozen_string_literal: true

RSpec.shared_context 'actions', shared_context: :metadata do
  let(:siret_lookup_response) do
    {
      "uniteLegale": {
        "score": 0,
        "siren": "string",
        "statutDiffusionUniteLegale": "string",
        "unitePurgeeUniteLegale": true,
        "dateCreationUniteLegale": "string",
        "sigleUniteLegale": "string",
        "sexeUniteLegale": "M",
        "prenom1UniteLegale": "string",
        "prenom2UniteLegale": "string",
        "prenom3UniteLegale": "string",
        "prenom4UniteLegale": "string",
        "prenomUsuelUniteLegale": "string",
        "pseudonymeUniteLegale": "string",
        "identifiantAssociationUniteLegale": "string",
        "trancheEffectifsUniteLegale": "string",
        "anneeEffectifsUniteLegale": "string",
        "dateDernierTraitementUniteLegale": "string",
        "nombrePeriodesUniteLegale": 0,
        "categorieEntreprise": "PME",
        "anneeCategorieEntreprise": "string",
        "periodesUniteLegale": [
          {
            "dateFin": "2021-03-02",
            "dateDebut": "2021-03-02",
            "etatAdministratifUniteLegale": "A",
            "changementEtatAdministratifUniteLegale": true,
            "nomUniteLegale": "string",
            "changementNomUniteLegale": true,
            "nomUsageUniteLegale": "string",
            "changementNomUsageUniteLegale": true,
            "denominationUniteLegale": "string",
            "changementDenominationUniteLegale": true,
            "denominationUsuelle1UniteLegale": "string",
            "denominationUsuelle2UniteLegale": "string",
            "denominationUsuelle3UniteLegale": "string",
            "changementDenominationUsuelleUniteLegale": true,
            "categorieJuridiqueUniteLegale": "string",
            "changementCategorieJuridiqueUniteLegale": true,
            "activitePrincipaleUniteLegale": "69.10Z",
            "nomenclatureActivitePrincipaleUniteLegale": "NAP",
            "changementActivitePrincipaleUniteLegale": true,
            "nicSiegeUniteLegale": "string",
            "changementNicSiegeUniteLegale": true,
            "economieSocialeSolidaireUniteLegale": "string",
            "changementEconomieSocialeSolidaireUniteLegale": true,
            "caractereEmployeurUniteLegale": "O",
            "changementCaractereEmployeurUniteLegale": true
          }
        ]
      }
    }
  end
end