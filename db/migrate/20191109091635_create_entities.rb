class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.date :since, null: false
      t.date :until
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
