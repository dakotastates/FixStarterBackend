class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :description
      t.belongs_to :problem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
