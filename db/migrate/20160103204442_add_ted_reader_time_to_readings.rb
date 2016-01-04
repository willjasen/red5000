class AddTedReaderTimeToReadings < ActiveRecord::Migration
  def change
    add_column :readings, :ted_reader_time, :datetime
  end
end
