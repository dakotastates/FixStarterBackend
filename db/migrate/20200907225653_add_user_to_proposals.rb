class AddUserToProposals < ActiveRecord::Migration[6.0]
  def change
    add_reference :proposals, :user, null: false, foreign_key: true
  end
end
