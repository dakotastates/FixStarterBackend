class AddStatusToProposals < ActiveRecord::Migration[6.0]
  def change
    add_column :proposals, :project_status, :boolean, default: false
  end
end
