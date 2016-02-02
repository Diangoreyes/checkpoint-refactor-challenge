class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :breed
      t.integer :age

      t.timestamps
    end
  end
end