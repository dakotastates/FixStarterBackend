class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string :problemTitle
      t.string :description
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
