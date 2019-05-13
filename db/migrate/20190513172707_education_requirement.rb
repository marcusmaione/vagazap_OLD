class EducationRequirement < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :education_requirement, :string
  end
end
