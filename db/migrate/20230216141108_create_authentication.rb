class CreateAuthentication < ActiveRecord::Migration[7.0]
  def change
    create_table :authentications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :uid, null: false
      t.string :provider, null: false

      t.timestamps
    end

    add_index :authentications, [:user_id, :provider], unique: true
  end
end
