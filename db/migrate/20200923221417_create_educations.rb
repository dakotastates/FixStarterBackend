class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.belongs_to :institution, null: false, foreign_key: true
      t.belongs_to :degree, null: false, foreign_key: true
      t.belongs_to :field, null: false, foreign_key: true
      t.boolean :graduate, default: false
      t.boolean :verified, default: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
