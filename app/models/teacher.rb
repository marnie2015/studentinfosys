class Teacher < ActiveRecord::Base
  belongs_to :position
  belongs_to :subject
  belongs_to :room
end
