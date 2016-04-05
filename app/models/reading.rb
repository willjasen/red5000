class Reading < ActiveRecord::Base
  belongs_to :ted_reader

  def self.summarized_info
    group_by_day(:created_at).sum(:power)
  end
  
end
