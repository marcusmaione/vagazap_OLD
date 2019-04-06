class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :level
      t.string :sector
      t.string :salary_range
      t.text :benefit
      t.text :description
      t.string :start_time
      t.string :end_time
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
