class CreateGames < ActiveRecord::Migration[4.2]
  def change
  	create_table :games do |t|
      t.belongs_to :user, index: true
      t.integer :destroyed_sub
      t.string :result
      t.timestamps
    end
  end
end



