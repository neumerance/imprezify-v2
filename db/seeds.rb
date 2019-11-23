# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = FactoryBot.create(:user, email: 'user@imprezify.com')
resume = FactoryBot.create(:resume, user: user)
FactoryBot.create(:work_experience, resume: resume)
FactoryBot.create_list(:education, 3, resume: resume)
FactoryBot.create_list(:skill, 5, resume: resume)
