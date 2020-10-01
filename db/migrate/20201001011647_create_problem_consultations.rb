class CreateProblemConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :problem_consultations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :problem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
