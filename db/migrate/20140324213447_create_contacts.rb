class CreateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.timestamps
    end
    Contact.create_translation_table! title: :string, content: :text
  end

  def down
    drop_table :contacts
    Contact.drop_translation_table!
  end
end
