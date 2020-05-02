class CreateDeaths < ActiveRecord::Migration[5.1]
  def change
    create_table :deaths do |t|
      t.string :Name
      t.string :Age
      t.string :Lieu

      t.timestamps
    end
  end
end
