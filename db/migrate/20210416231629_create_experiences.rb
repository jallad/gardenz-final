class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :project_name
      t.date :from
      t.date :to
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
