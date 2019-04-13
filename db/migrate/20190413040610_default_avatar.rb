class DefaultAvatar < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :avatar, :string, default: "user-avatar-2.png"
  end
end
