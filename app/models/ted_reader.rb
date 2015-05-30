class TedReader < ActiveRecord::Base
  attr_reader :url

  def initialize(url)
    @url = url
  end
end
