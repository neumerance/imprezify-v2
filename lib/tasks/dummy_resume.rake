require 'ffaker'

namespace :dummy_resume do
  desc 'Creates a dummy resume for an account'
  task generate: :environment do
    begin
      Resume.transaction do
        user = User.find_by_email(ENV['email'])
        resume = user.resumes.create(name: ENV['name'], template_name: ENV['template_name'])
        basic_info = resume.basic_info

        basic_info.name = FFaker::Name.name
        basic_info.title = FFaker::Job.title
        basic_info.profile_overview = FFaker::Lorem.paragraphs.join("\n\n")
        basic_info.birthdate = '1987-04-15'
        basic_info.nationality = 'Singaporean'
        basic_info.height = `5' 4"`
        basic_info.gender = [0, 1].sample
        basic_info.religion = 'Christian'
        basic_info.address = FFaker::AddressUS.street_address
        basic_info.city = FFaker::Address.city
        basic_info.country = FFaker::Address.country
        basic_info.postal_code = FFaker::AddressUS.zip_code
        basic_info.photo.attach(
          io: open("https://i.pravatar.cc/413"),
          filename: 'photo.jpg'
        )
        basic_info.save!

        3.times do
          experience = resume.work_experiences.create(
            name: FFaker::Company.name,
            title: FFaker::Job.title,
            since: Time.now - 3.months,
            current: true,
            description: 3.times.map { FFaker::Lorem.paragraph },
            address: FFaker::AddressUS.street_address,
            city: FFaker::Address.city,
            country: FFaker::Address.country,
            postal_code: FFaker::AddressUS.zip_code,
            phone: "+65 #{FFaker::PhoneNumberSG::mobile_number}",
            email: FFaker::Internet.email
          )
          image = open("https://api.adorable.io/avatars/70/#{FFaker::Lorem.word}.png")
          experience.logo.attach(io: image, filename: 'logo.jpg')
          experience.save!
        end

        3.times do
          year = [8, 6, 4].sample
          graduated = Time.now - year.years
          education = resume.educations.create(
            name: FFaker::Education.school,
            title: FFaker::Education.degree,
            since: graduated,
            upuntil: graduated - 4.years,
            current: true,
            description: 3.times.map { FFaker::Lorem.paragraph },
            address: FFaker::AddressUS.street_address,
            city: FFaker::Address.city,
            country: FFaker::Address.country,
            postal_code: FFaker::AddressUS.zip_code,
            phone: "+65 #{FFaker::PhoneNumberSG::mobile_number}",
            email: FFaker::Internet.email
          )
          image = open("https://api.adorable.io/avatars/70/#{FFaker::Lorem.word}.png")
          education.logo.attach(io: image, filename: 'logo.jpg')
          education.save!
        end

        5.times do
          resume.skills.create(
            name: FFaker::Skill.specialty,
            value: [:newbie, :beginner, :skilled, :experienced, :expert].sample
          )
        end

        3.times do
          resume.character_references.create(
            name: FFaker::Name.name,
            title: FFaker::Job.title,
            phone: "+65 #{FFaker::PhoneNumberSG::mobile_number}",
            email: FFaker::Internet.email
          )
        end

        resume.contacts.create(
          [
            {
              name: :email,
              value: FFaker::Internet.email
            },
            {
              name: :skype,
              value: FFaker::Internet.user_name
            },
            {
              name: :linkedin,
              value: "https://linkedin.com/in/#{FFaker::Internet.user_name}"
            },
            {
              name: :mobile,
              value: "+65 #{FFaker::PhoneNumberSG::mobile_number}"
            }
          ]
        )
      end
      puts "Successfuly create resume for #{ENV['email']}"
    rescue => e
      puts "Unable to generate resume: #{e.message}"
      puts e.backtrace
    end
  end
end
