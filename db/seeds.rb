# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Section.create([
    {description: 'Section 1'},
    {description: 'Section 2'},
    {description: 'Section 3'},
    {description: 'Section 4'}
])

YearLevel.create([
    {description: 'Grade 1'},
    {description: 'Grade 2'},
    {description: 'Grade 3'},
    {description: 'Grade 4'},
    {description: 'Grade 5'},
    {description: 'Grade 6'},
    {description: 'Grade 7'},
    {description: 'Grade 8'},
    {description: 'Grade 9'},
    {description: 'Grade 10'},
    {description: 'Grade 11'},
    {description: 'Grade 12'}
])


Subject.create([
    #elementary
    {description: "Elem - ESP"},
    {description: "Elem - MOTHER TONGUE"},
    {description: "Elem - Filipino"},
    {description: "Elem - Sibika"},
    {description: "Elem - Computer"},
    {description: "Elem - English"},
    {description: "Elem - Mathematics"},
    {description: "Elem - Science"},
    {description: "Elem - Mapeh"},
    {description: "Elem - T.L.E."},
    {description: "Elem - EPP"},

    #High School
    {description: "HS - ESP"},
    {description: "HS - Filipino"},
    {description: "HS - Sibika"},
    {description: "HS - Computer"},
    {description: "HS - English"},
    {description: "HS - Mathematics"},
    {description: "HS - Science"},
    {description: "HS - Mapeh"},
    {description: "HS - T.L.E"}
])

User.create([
    {user_name: "admin", user_pass: "admin", access: 1, status: "Active"}
])

Position.create([
    {description: "Teacher I"},
    {description: "Teacher II"},
    {description: "Teacher III"}
])

Room.create([
    {description: "Room 1"},
    {description: "Room 2"},
    {description: "Room 3"},
    {description: "Room 4"},
    {description: "Room 5"},
    {description: "Room 6"},
    {description: "Room 7"},
    {description: "Room 8"},
    {description: "Room 9"},
    {description: "Room 10"},
    {description: "Room 11"},
    {description: "Room 12"}
])