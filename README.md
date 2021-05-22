### Setup

- `bundle install`
- `yarn install`
- `createdb nt_test`
- `bundle exec rails db:migrate`

---

### Use case 'signup' (app/services/signup/trigger.rb)

**Contexte :**  

Le service de signup se fait par des informations standard d'un user (`UserAccount`),  
ainsi que l'information de siret correspondant à l'entreprise de cet utilisateur.  
L'envoi de cette information de siret permet de créer dans la même action de signup
les enegistrements nécessaires au privisionning des différents éléments structurant
la présence de cete utilisateur sur la plateforme (`Brand::Company`, `Brand::Account` et `Brand::Member`).

---

Soit l'input suivant (`params` de la méthode `initialize` app/services/signup/trigger.rb) :

```
{
  email:         "string",  # required
  password:      "string",  # required
  phone_number:  "string",   # optional
  first_name:     "string",  # optional
  last_name:     "string",  # optional
  siret:         "string"   # required
}
```

---

1. **Créer un user (`User::Account`)**
  Le user doit dans un premier temps être créé sur auth0 ([app/services/auth0/user/create.rb](./app/services/auth0/create.rb))
  Le payload retourné par la création du user sur auth0 contient l'attribut `user_id`.  
  Cette valeur `user_id` doit compléter la création de l'utilisateur (champ `auth0_uid` du `UserAccount`)
  **• Réaliser une spec avec stub success du retour auth0**  
  **• Réaliser une spec avec stub error du retour auth0**  
  *Un exemple de retour de `Auth0::User::Create` est fourni dans spec/support/contexts/auth0.rb*  

2. **Créer une compagnie (`Brand::Company`)**  
  Les infos de la compagnie sont retournées après un lookup de l'api sirene (service `::Siret::Lookup`),  
  le payload doit être utilisé pour créer la compagnie (label)  
  Seuls certains ape_code sont acceptés dans l'application (voir [config/initializers/constants.rb](config/initializers/constants.rb))  
  Le user account créé en 1. est le owner de la company  
  **• Réaliser une spec avec ape_code accepté**  
  **• Réaliser une spec avec ape_code non-accepté**  
  Un exemple de retour de `Siret::Lookup` est fourni dans [spec/support/contexts/siret_lookup.rb](spec/support/contexts/siret_lookup.rb)  
  en vue de stub (ou equivalent) le retour du service.
  Le champ d'appui pour le label à utiliser dans la création de la compagnie est `uniteLegale.periodesUniteLegale.nomUniteLegale`  
  Le champ d'appui pour le code APE dans le mock est `uniteLegale.periodesUniteLegale.activitePrincipaleUniteLegale`  
  La compagnie reçoit un siren_number (les 9 premiers chiffres d'un numéro de siret)

3. **Créer un brand (`Brand::Account`)**  
  Il appartient à la `Brand::Company` créée en 2.  
  Le label est par defaut le même que la `Brand::Company` créé en 2.  
  Le siret_number est celui envoyé dans le payload initial

4. **Créer un membre de la brand (`Brand::Member`)**  
  Le `Brand::Member` à créer appartient au `Brand::Account` créé en 3. et au `User::Account` créé en 1.

**• Réaliser une spec validant la création des différents objets cités (`UserAccount`, `Brand::Company`, `Brand::Account` et `Brand::Member`)**
