class YearLevel < ActiveRecord::Base
    has_one :student_year_section
end
