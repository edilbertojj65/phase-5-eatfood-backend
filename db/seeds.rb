# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Group.destroy_all
GroupUser.destroy_all
Photo.destroy_all
Review.destroy_all
20.times do |index|
   
    user1 = User.create!(name:Faker::Name.name, email:Faker::Internet.email, dateObird:Faker::Time.between(from: 180.months.ago, to: 1.week.ago))
     
     group1 = Group.create!(name:Faker::Job.education_level , user_id:user1.id, typeName:"Public")
     gropuser1 = GroupUser.create!(group_id:group1.id, name:Faker::Name.name)
     photo1 =  Photo.create!(namePhoto:Faker::Creature::Animal.name, url:Faker::Avatar.image(slug: "my-own-slug", size: "50x50") ,mimeType:Faker::File.mime_type,
              fileName:Faker::File.file_name(dir: 'path/to'),user_id:user1.id ,
              group_user_id:gropuser1.id)
              Review.create!(comment:Faker::Lorem.paragraph , rating:Faker::Number.between(from: 1, to: 5), photo_id:photo1.id, group_user_id:gropuser1.id )
             

end

p "Created #{User.count} users"
p "Created #{Group.count} groups"
p "Created #{GroupUser.count} groupusers"
p "Created #{Photo.count} photos"
p "Created #{Review.count} reviews"

 
