class CreateBasicInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :basic_infos do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :profile_overview, null: false
      t.date :birthdate
      t.string :nationality
      t.integer :gender # 0 male 1 female
      t.string :height
      t.string :religion
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code
      t.references :resume, index: true
      t.timestamps
    end
    add_attachment :basic_infos, :photo
  end
end
