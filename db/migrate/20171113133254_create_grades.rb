class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.float :computer1
      t.float :computer2
      t.float :computer3
      t.float :computer4
      t.float :english1
      t.float :english2
      t.float :english3
      t.float :english4
      t.float :epp1
      t.float :epp2
      t.float :epp3
      t.float :epp4
      t.float :filipino1
      t.float :filipino2
      t.float :filipino3
      t.float :filipino4
      t.float :mapeh1
      t.float :mapeh2
      t.float :mapeh3
      t.float :mapeh4
      t.float :mathematics1
      t.float :mathematics2
      t.float :mathematics3
      t.float :mathematics4
      t.float :mother_tongue1
      t.float :mother_tongue2
      t.float :mother_tongue3
      t.float :mother_tongue4
      t.float :science1
      t.float :science2
      t.float :science3
      t.float :science4
      t.float :sibika1
      t.float :sibika2
      t.float :sibika3
      t.float :sibika4
      t.float :tle1
      t.float :tle2
      t.float :tle3
      t.float :tle4
      t.string :school_year
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
