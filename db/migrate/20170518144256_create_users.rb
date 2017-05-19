class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest #observar que ya no se llama ":password" como lo usamos en usuarios dummy
      t.timestamps
    end
  end
end
