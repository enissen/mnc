class TranslatesImpresses < ActiveRecord::Migration
  def self.up
    Impress.create_translation_table!({
      :title => :string,
      :content => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Impress.drop_translation_table! :migrate_data => true
  end
end