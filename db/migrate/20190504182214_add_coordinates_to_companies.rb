class AddCoordinatesToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :address_complement, :string
  end
end
