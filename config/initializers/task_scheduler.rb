Rails.application.config.after_initialize do
  scheduler = Rufus::Scheduler.new
  scheduler.every '5s' do
    TedReader.track
  end
end
