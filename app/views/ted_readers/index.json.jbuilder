json.array!(@ted_readers) do |ted_reader|
  json.extract! ted_reader, :id, :url
  json.url ted_reader_url(ted_reader, format: :json)
end
