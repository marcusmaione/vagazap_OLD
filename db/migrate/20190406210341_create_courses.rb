class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :type
      t.string :school_name
      t.text :description
      t.string :complete
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
