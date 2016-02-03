class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.integer :owner_id

      t.timestamps
    end
  end
end
