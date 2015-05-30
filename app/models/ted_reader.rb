class TedReader < ActiveRecord::Base
  validates_presence_of :hostname
end
