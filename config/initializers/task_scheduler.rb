Rails.application.config.after_initialize do
  scheduler = Rufus::Scheduler.new
  scheduler.every '5s' do
    TedReader.find_each do |ted_reader|
      ted_reader.track
    end
  end
end
