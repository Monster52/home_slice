class AddMathToCurriculums < ActiveRecord::Migration
  def change
    add_column :curriculums, :math, :string
  end
end
