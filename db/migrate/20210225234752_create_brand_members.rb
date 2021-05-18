class CreateBrandMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :brand_members do |t|
      with_options(index: true, foreign_key: true) do
        t.references :brand_account
        t.references :user_account
      end
      t.timestamps
    end
  end
end
