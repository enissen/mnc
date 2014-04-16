class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.string :dimension
      t.timestamps
      #add_attachment :images, :file
    end
    Image.create_translation_table! name: :string, material: :string, description: :text
  end

  def down
    #remove_attachment :images, :file
    drop_table :images
    Image.drop_translation_table!
  end
end
