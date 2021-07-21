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
  puts "Please enter the name and cohort if known of the students"
  puts "To finish, just hit return twice"
  
  students = []

  puts "Name?"
  name = gets.chomp

  while !name.empty? do
    puts "Cohort?"
    cohort = gets.chomp

    months = [
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december'
    ]
    
    while !months.include?(cohort) do
      if cohort.empty?
        cohort = 'november'
      else
        puts "cohort misspelt, please try again"
        cohort = gets.chomp
      end
    end

    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} #{students.count > 1 ? "students" : "student"}"

    puts "Name?"
    name = gets.chomp
  end

  students
end

def print_header(names)
  if !names.empty?
    puts "The students of Villains Academy".center(200)
    puts "-------------".center(200)
  end
end

def print(names)
  if !names.empty?
    count = 0
    while count < names.length
      puts "#{count + 1}. #{names[count][:name]} (#{names[count][:cohort]} cohort)".center(200)
      count += 1
    end
  end
end

def print_footer(names)
  if !names.empty?
    puts "Overall, we have #{names.count} great #{names.count > 1 ? "students" : "student"}"
  end
end

students = input_students

print_header(students)
print(students)
print_footer(students)

students_by_cohort = {}

students.each do |student|
  month = student[:cohort]
  name = student[:name]
  if students_by_cohort[month].nil?
    students_by_cohort[month] = [name]
  else
    students_by_cohort[month].push(name)
  end
end

students_by_cohort.each do |cohort, names|
  puts cohort
  puts names
end