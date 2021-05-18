class CreateUserAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_accounts do |t|
      with_options(null: false) do
        t.string :email, required: true
        t.string :auth0_uid, required: true
      end
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.timestamps
    end

    add_index :user_accounts, %i[email], unique: true
  end
end
