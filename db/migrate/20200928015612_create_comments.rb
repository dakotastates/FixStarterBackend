class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :recipient_id
      t.integer :likes, :default => 0

      t.timestamps
    end
  end
end
