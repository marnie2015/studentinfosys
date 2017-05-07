class StudentYearSection < ActiveRecord::Base
  belongs_to :student
  belongs_to :year_level
  belongs_to :section
end
