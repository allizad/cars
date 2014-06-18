require_relative 'cars'

car_a = Car.new("white")
car_b = Car.new("red")
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b

car_b.color = "black"
Car.cars_per_color("black")

puts Car.total_car_count
c1 = Car.new("black")
puts Car.total_car_count
c2 = Car.new("red")
puts Car.total_car_count

c3 = Car.new(Car.most_popular_color)

puts Car.most_popular_color

best_color = Car.most_popular_color
Car.new(best_color)