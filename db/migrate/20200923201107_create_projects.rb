class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.belongs_to :proposal, null: false, foreign_key: true
      t.boolean :active, default: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
