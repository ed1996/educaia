class AddOtherFieldToFormation < ActiveRecord::Migration[5.1]
  def change
    add_column :formations, :profil, :string
  end
end
