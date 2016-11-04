puts 'Seeding Users'

20.times do
  User.create(
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :phone => Faker::PhoneNumber.cell_phone
  )

  print '.'
end

puts "\nSeeding Points"

points = [
          ['Acacia Estates', 14.528641, 121.062207],
          ['Ayala Triangle', 14.555927, 121.023034],
          ['UP Town Center', 14.651154, 121.075247],
          ['Greenbelt 1', 14.553096, 121.019592]
         ]

points.each do |point|
  Point.create :name => point[0], :latitude => point[1], :longitude => point[2]
  print '.'
end

puts "\nSeeding Routes"

routes = [
          [1,2],
          [2,1],
          [3,2],
          [2,3],
          [1,4],
          [4,1]
         ]

routes.each do |route|
  Route.create :origin_id => route[0], :destination_id => route[1], :price => 90
  print '.'
end

puts ''
