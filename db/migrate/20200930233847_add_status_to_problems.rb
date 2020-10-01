class AddStatusToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :status, :boolean
  end
end
