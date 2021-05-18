class CreateBrandAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :brand_accounts do |t|
      t.references :brand_company, index: true, foreign_key: true
      t.string :label, null: false
      t.string :siret_number, null: false
      t.timestamps
    end
  end
end
