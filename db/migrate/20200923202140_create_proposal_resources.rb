class CreateProposalResources < ActiveRecord::Migration[6.0]
  def change
    create_table :proposal_resources do |t|
      t.belongs_to :resource, null: false, foreign_key: true
      t.belongs_to :proposal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
