class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer :type, null: false # email 0, skype 1, linkedin 2, mobile 3, telephone 4
      t.string :value, null: false
      t.references :resume, index: true
      t.timestamps
    end
  end
end
