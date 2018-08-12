class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.decimal :price #precision: ​8, ​scale: ​2
      t.text :description
       t.string :image_url
      t.integer :owner_id

      t.timestamps
    end
  end
end
