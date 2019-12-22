class AddShareableCodeToResume < ActiveRecord::Migration[6.0]
  def change
    add_column :resumes, :sharing_code, :string
  end
end
