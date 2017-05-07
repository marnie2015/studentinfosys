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
    {description: 'Grade 7'},
    {description: 'Grade 8'},
    {description: 'Grade 9'},
    {description: 'Grade 10'},
    {description: 'Grade 11'},
    {description: 'Grade 12'}
])