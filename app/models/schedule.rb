class Schedule < ActiveRecord::Base
  belongs_to :year_level
  belongs_to :section
  belongs_to :teacher

  def self.index_fields
    joins(:position, :subject, :room).
    select("teachers.id, teachers.teacherid, teachers.first_name,
            teachers.last_name,
            positions.description pos,
            subjects.description sub,
            rooms.description rm")
  end
end
