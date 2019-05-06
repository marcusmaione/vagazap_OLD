class CompanyAddressType < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :address, :string
  end
end
