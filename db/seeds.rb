# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Real (Physical)", "Genetic", "Digital", "Testimony", "Exculpatory", "Scientific", "Demonstrative", "Eyewitness", "Genetic (DNA)"].each do |ex|
  Category.find_or_create_by_name(ex)
end