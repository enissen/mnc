class CreateImpresses < ActiveRecord::Migration
  def change
    create_table :impresses do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
