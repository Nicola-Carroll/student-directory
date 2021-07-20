# # print the list of students
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

def input_students
  puts "Please enter the name, age, and favourite food of the students"
  puts "To finish, just hit return twice"
  
  students = []

  puts "Name?"
  name = gets.chomp

  while !name.empty? do
    puts "Age?"
    age = gets.chomp
    puts "Favourite food?"
    food = gets.chomp

    students << {name: name, age: age, favourite_food: food, cohort: :november}
    puts "Now we have #{students.count} students"

    puts "Name?"
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy".center(200)
  puts "-------------".center(200)
end

def print(names)
  count = 0
  while count < names.length
    puts "#{count + 1}. #{names[count][:name]} is #{names[count][:age]} and likes #{names[count][:favourite_food]} (#{names[count][:cohort]} cohort)".center(200)
    count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)