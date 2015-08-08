class AddReaderRefToReadings < ActiveRecord::Migration
  def change
    add_reference :readings, :reader, index: true, foreign_key: true
  end
end
