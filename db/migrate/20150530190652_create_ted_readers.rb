class CreateTedReaders < ActiveRecord::Migration
  def change
    create_table :ted_readers do |t|
      t.string :hostname

      t.timestamps null: false
    end
  end
end
