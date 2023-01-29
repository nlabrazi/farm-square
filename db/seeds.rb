p " ********************************* "
p " *                               * "
p " *         BEGIN OF SEED         * "
p " *                               * "
p " ********************************* "


puts ""

p "Destroy curent data..."

puts ""

p "Destroying Bookings... #{Booking.count} "
Booking.destroy_all
p "Destroying Tasks... #{Task.count} "
Task.destroy_all
p "Destroying Actions... #{Action.count} "
Action.destroy_all
p "Destroying Farms... #{Farm.count} "
Farm.destroy_all
p "Destroying Cities... #{City.count} "
City.destroy_all
p "Destroying Articles... #{Article.count} "
Article.destroy_all
p "Destroying Users... #{User.count} "
User.destroy_all
p "Destroying Profils... #{Profil.count} "
Profil.destroy_all
p "-----------------------"

puts ""

p "Creating profils..."
  Profil.create(name: "invited", id:1)
  Profil.create(name: "member", id:2)
  Profil.create(name: "admin", id:3)
p "Profils creation DONE, result below.... "
puts ""
tp Profil.all
puts ""


p "Creating users..."
4.times do |i|
  User.create(email: "member#{i+1}@user.com", password: "password", password_confirmation: "password", profil_id: 2)
end

p "Users creation DONE, result at bottom !"
puts ""
p "Creating admin..."
admin = User.create(email:"admin@admin.com", profil_id: 3, password: "password", password_confirmation: "password")
p "Users & Admin now created, #{User.count}"
p "please wait a bit"
3.times do
  sleep 1
  puts "...................."
end
puts ""


p " ********************************** "
p "                                    "
p "......now displaying all users......"
p "                                    "
p " ********************************** "
puts ""
tp User.all
puts ""


p "Creating s..."
10.times do
  l = City.new
  l.name = Faker::Address.city
  l.save
end
p "Cities creation DONE, result below.... "
puts ""
tp City.all
puts ""


p "Creating actions..."
a = Action.new
  a.name = "Planter"
  a.description = "Id proident incididunt eu deserunt dolor anim velit velit qui cupidatat occaecat irure proident in et in in do labore."
  a.save
a = Action.new
  a.name = "Labourer"
  a.description = "Id proident incididunt eu deserunt dolor anim velit velit qui cupidatat occaecat irure proident in et in in do labore."
  a.save
a = Action.new
  a.name = "Arroser"
  a.description = "Id proident incididunt eu deserunt dolor anim velit velit qui cupidatat occaecat irure proident in et in in do labore."
  a.save
a = Action.new
  a.name = "Récolter"
  a.description = "Id proident incididunt eu deserunt dolor anim velit velit qui cupidatat occaecat irure proident in et in in do labore."
  a.save
a = Action.new
  a.name = "Poulailler"
  a.description = "Id proident incididunt eu deserunt dolor anim velit velit qui cupidatat occaecat irure proident in et in in do labore."
  a.save
a = Action.new
  a.name = "Aquaponie"
  a.description = "Id proident incididunt eu deserunt dolor anim velit velit qui cupidatat occaecat irure proident in et in in do labore."
  a.save
p "Actions creation DONE, result below.... "
puts ""
tp Action.all
puts ""


p "Creating farms..."
10.times do |i|
  f = Farm.new
  f.name = "Farm #{i+1}"
  f.city_id = City.all.sample.id
  f.address = Faker::Address.street_address
  f.save
end
p "Farms creation DONE, result below.... "
puts ""
tp Farm.all
puts ""

#I18n.locale = 'ja'
p "Creating tasks..."
1.times do |i|
  t = Task.new
  t.title = "Planter des tomates"
  t.start_date = "2021-03-25 12:30:00"
  t.end_date = "2021-03-25 13:30:00"
  t.description = Faker::Movie.quote
  t.participant_number = rand(0..5)
  t.farm_id = Farm.all.sample.id
  t.action_id = Action.all.sample.id
  t.save
end
1.times do |i|
  t = Task.new
  t.title = "Planter des fraises"
  t.start_date = "2021-03-25 15:30:00"
  t.end_date = "2021-03-25 20:00:00"
  t.description = Faker::Movie.quote
  t.participant_number = rand(0..5)
  t.farm_id = Farm.all.sample.id
  t.action_id = Action.all.sample.id
  t.save
end
1.times do |i|
  t = Task.new
  t.title = "Labourrer un champ"
  t.start_date = "2021-03-26 09:00:00"
  t.end_date = "2021-03-26 13:00:00"
  t.description = Faker::Movie.quote
  t.participant_number = rand(0..5)
  t.farm_id = Farm.all.sample.id
  t.action_id = Action.all.sample.id
  t.save
end
1.times do |i|
  t = Task.new
  t.title = "Arrosage"
  t.start_date = "2021-03-27 14:30:00"
  t.end_date = "2021-03-27 19:30:00"
  t.description = Faker::Movie.quote
  t.participant_number = rand(0..5)
  t.farm_id = Farm.all.sample.id
  t.action_id = Action.all.sample.id
  t.save
end
1.times do |i|
  t = Task.new
  t.title = "Cueillir les fraises"
  t.start_date = "2021-03-27 14:0:00"
  t.end_date = "2021-03-27 16:30:00"
  t.description = Faker::Movie.quote
  t.participant_number = rand(0..5)
  t.farm_id = Farm.all.sample.id
  t.action_id = Action.all.sample.id
  t.save
end
1.times do |i|
  t = Task.new
  t.title = "Arrosage"
  t.start_date = "2021-03-29 06:00:00"
  t.end_date = "2021-03-29 09:30:00"
  t.description = Faker::Movie.quote
  t.participant_number = rand(0..5)
  t.farm_id = Farm.all.sample.id
  t.action_id = Action.all.sample.id
  t.save
end
1.times do |i|
  t = Task.new
  t.title = "Planter des patates"
  t.start_date = "2021-03-28 9:30:00"
  t.end_date = "2021-03-28 19:30:00"
  t.description = Faker::Movie.quote
  t.participant_number = rand(0..5)
  t.farm_id = Farm.all.sample.id
  t.action_id = Action.all.sample.id
  t.save
end

p "Tasks creation DONE, result below.... "
puts ""
tp Task.all
puts ""


p "Creating bookings..."
4.times do |i|
  b = Booking.new
  b.user_id = User.all.sample.id
  b.task_id = Task.all.sample.id
  b.save
end
p "Bookings creation DONE, result below.... "
puts ""
tp Booking.all

p "Creating articles..."
10.times do |i|
  a = Article.new
  a.title = Faker::Book.title
  a.content = Faker::Lorem.sentence(word_count: rand(10..25))
  a.user_id = User.all.sample.id
  a.save
end
p "Articles creation DONE, result below.... "
puts ""
tp Article.all

p "Creating users WITHOUT TASKS..."
4.times do |i|
  User.create(email: "user#{i+4}@user.com", password: "password", password_confirmation: "password")
end
p "Users (without tasks) now created, #{User.count}"
p "please wait a bit"
1.times do
  sleep 1
  puts "...................."
end
puts ""


p " ********************************** "
p "                                    "
p "......now displaying all users......"
p "                                    "
p " ********************************** "
puts ""
tp User.all
puts ""
puts ""


p " ********************************* "
p " *                               * "
p " *          END OF SEED          * "
p " *                               * "
p " ********************************* "
