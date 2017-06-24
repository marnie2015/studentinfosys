class Student < ActiveRecord::Base
    has_many :student_year_sections

    def self.index_fields
        joins(:student_year_sections => [:year_level])
         .select("students.id, 
                          students.student_id, 
                          students.fname, 
                          students.mname, 
                          students.lname, 
                          students.address,
                          students.status, 
                          year_levels.description grade")
                            
    end
end
