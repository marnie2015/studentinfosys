# class Student < ActiveRecord::Base
#     has_many :student_year_sections
#     has_many :payments

#     def self.index_fields
#         joins(:student_year_sections)
#          .select("students.id, 
#                           students.student_id, 
#                           students.fname, 
#                           students.mname, 
#                           students.lname, 
#                           students.address,
#                           students.status, max(student_year_sections.school_year) school_year")
#         .group("students.id")
                            
#     end
# end
class Student < ActiveRecord::Base
    has_many :student_year_sections
    has_many :payments

    def self.index_fields
        joins(:student_year_sections => [:year_level])
         .select("students.id, 
                          students.student_id, 
                          students.fname, 
                          students.mname, 
                          students.lname, 
                          students.address,
                          students.status, 
                          year_levels.description grade,
                          student_year_sections.year_level_id,
                          student_year_sections.section_id")
                            
    end
end
