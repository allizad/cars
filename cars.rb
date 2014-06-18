class Car

	#class variable of all instances of Cars.
	@@total_car_count = 0

	#can only be called on the class, not the instance, or total car count
	def self.total_car_count
		@@total_car_count
	end

	#class variable hash that keeps track of number of vehicles associated with each color.
	@@cars_per_color = {}
	attr_reader :cars_per_color

	#call number of cars that have color v in Class.
	def self.cars_per_color(k)
		puts @@cars_per_color[k]
	end

	#call key with the largest value in cars_per_color hash in Class.
	def self.most_popular_color
		@@cars_per_color.max_by {|k, v| 
			return k if v == @@cars_per_color.values.max
		}
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	#initialize new car with default color of blue
	def initialize(color="blue")
		@color = color
		@fuel = 10
		@distance = 0
		@@total_car_count += 1

		#add car color to the cars_per_color hash, 
		#where key = color.to_sym, and value = count of car instances with that color
		if @@cars_per_color.has_key?(@color) == true
			@@cars_per_color[@color] += 1
		else
			@@cars_per_color[@color] = 1
		end
	end

	#write new color for instance, which also updates class hash of car colors:
	def color=(value)
		
		#update hash, first: detract from previous color key
		@@cars_per_color[@color] -= 1

		@color = value

		if @@cars_per_color.has_key?(@color) == true
			@@cars_per_color[@color] += 1
		else
			@@cars_per_color[@color] = 1
		end	

	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

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

# best_color = Car.most_popular_color
# Car.new(best_color)