class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.string :reading
      t.string :writing
      t.string :science
      t.string :history
      t.string :foreign_lang
      t.string :sports
      t.string :music
      t.string :visual_art
      t.string :performing_art
      t.string :religion
      t.string :field_trip
      t.string :trade_skill
      t.string :heath
      t.string :computer
      t.string :community
      t.string :home_eco
      t.string :elective
      t.string :misc

      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
