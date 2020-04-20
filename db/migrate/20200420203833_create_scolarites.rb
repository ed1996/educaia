class CreateScolarites < ActiveRecord::Migration[5.1]
  def change
    create_table :scolarites do |t|
      t.string :filiere
      t.float :francais
      t.float :philosophie
      t.float :histoiregeo
      t.float :lv1
      t.float :lv2
      t.float :eps
      t.float :mathematique
      t.float :physiquechimie
      t.float :svt
      t.float :ses
      t.float :spemath
      t.float :spesvt
      t.float :spephysique
      t.float :tpe
      t.float :lv3
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
