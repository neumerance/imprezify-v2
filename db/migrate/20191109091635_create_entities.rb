class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :title
      t.date :since
      t.date :upuntil
      t.boolean :current, default: false
      t.text :description, array: true, default: []
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code
      t.text :contacts, array: true, default: []
      t.string :type, null: false, index: true
      t.references :resume, index: true
      t.timestamps
    end
    add_attachment :entities, :logo
  end
end
