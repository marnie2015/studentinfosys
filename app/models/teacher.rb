class Teacher < ActiveRecord::Base
  belongs_to :position
  belongs_to :subject
  belongs_to :room
  has_many :schedules

  def self.index_fields
    joins(:position, :subject, :room).
    select("teachers.id, teachers.teacherid, teachers.first_name,
            teachers.last_name,
            positions.description pos,
            subjects.description sub,
            rooms.description rm")
  end

  mount_uploader :image, ImageUploader
end
