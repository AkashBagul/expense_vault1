class CreateUsers < ActiveRecord::Migration[8.1]
  def change
   create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.timestamps
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :mobile_number
    end
  end
end
