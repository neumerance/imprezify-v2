class CreateCommonNameValues < ActiveRecord::Migration[6.0]
  def change
    create_table :common_name_values do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.text :description, array: true, default: []
      t.string :type, null: false, index: true
      t.references :resume, index: true
      t.timestamps
    end
  end
end
