class CreateWorkExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :work_experiences do |t|
      t.references :resume, index: true
      t.timestamps
    end
  end
end
