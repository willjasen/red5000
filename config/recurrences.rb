#configure.logging = "quiet"

every 5.seconds, :save => true do
  TedReader.track
end
