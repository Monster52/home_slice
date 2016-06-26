class AddTitleToCurriculums < ActiveRecord::Migration
  def change
    add_column :curriculums, :title, :string
  end
end
