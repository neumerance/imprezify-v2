class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.references :resume, index: true
      t.timestamps
    end
  end
end
