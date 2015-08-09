class AddReaderRefToReadings < ActiveRecord::Migration
  def change
    add_reference :readings, :ted_reader, index: true, foreign_key: true
  end
end
