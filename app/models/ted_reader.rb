class TedReader < ActiveRecord::Base
  attr_accessor :url

  def initialize(url)
    @url = url
  end
end
