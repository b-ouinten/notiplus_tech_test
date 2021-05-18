class CreateBrandCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :brand_companies do |t|
      t.references :owner, index: true, foreign_key: { to_table: :user_accounts }
      t.string :label, null: false
      t.string :siren_number, null: false
      t.timestamps
    end
  end
end
