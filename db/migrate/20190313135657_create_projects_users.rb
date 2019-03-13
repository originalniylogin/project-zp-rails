class CreateProjectsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :projects_users do |t|
      t.belongs_to :project, null: false, foreign_key: true, index: true
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.integer :typeofrate, null: false
      t.integer :currency, null: false
      t.float :rate, null: false

      t.timestamps
    end
  end
end
