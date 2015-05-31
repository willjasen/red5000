class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.float :voltage
      t.integer :power
      t.integer :kva

      t.timestamps null: false
    end
  end
end
