class CreateDegrees < ActiveRecord::Migration[5.2]
  def change
    create_table :degrees do |t|
      t.string :level
      t.string :school_name
      t.string :field
      t.string :complete
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
