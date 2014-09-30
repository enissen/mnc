class CreateCurriculumVitaes < ActiveRecord::Migration
  def up
    create_table :curriculum_vitaes do |t|
      t.timestamps
    end
    CurriculumVitae.create_translation_table! title: :string, content: :text
  end

  def down
    drop_table :curriculum_vitaes
    CurriculumVitae.drop_translation_table!
  end
end
