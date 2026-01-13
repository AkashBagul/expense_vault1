class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string  :name, null: false
      t.decimal :monthly_limit, precision: 10, scale: 2

      t.timestamps
    end

    add_index :categories, [ :user_id, :name ], unique: true
  end
end
