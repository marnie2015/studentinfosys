class Schedule < ActiveRecord::Base
  belongs_to :year_level
  belongs_to :section
end
