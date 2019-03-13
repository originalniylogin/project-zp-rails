class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.belongs_to :project, null: false, foreign_key: true, index: true
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.date :from, null: false
      t.date :to, null: false
      t.float :amount, null: false
      t.float :to_pay

      t.timestamps
    end
  end
end
