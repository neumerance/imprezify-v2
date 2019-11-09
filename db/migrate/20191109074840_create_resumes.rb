class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.string :name
      t.references :user, index: true
      t.timestamps
    end
  end
end
