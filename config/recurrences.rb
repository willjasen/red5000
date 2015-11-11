configure.logging = "quiet"

configure.logger do |message, log_level|
  Rails.logger.info.send(log_level, message)
end

every 5.seconds, :save => true do
  TedReader.track
end
