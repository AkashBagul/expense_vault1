class CreateExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :expenses, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, null: false, type: :uuid, foreign_key: true
      t.references :category, null: false, type: :uuid, foreign_key: true

      t.string  :title, null: false
      t.text    :description
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.date    :spent_on, null: false
      t.string  :payment_method

      t.timestamps
    end
  end
end
