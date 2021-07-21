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
@students = []

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

def print_header
  if !@students.empty?
    puts "The students of Villains Academy".center(200)
    puts "-------------".center(200)
  end
end

def print_students_list
  if !@students.empty?
    count = 0
    while count < @students.length
      puts "#{count + 1}. #{@students[count][:name]} (#{@students[count][:cohort]} cohort)".center(200)
      count += 1
    end
  end
end

def print_footer
  if !@students.empty?
    puts "Overall, we have #{@students.count} great #{@students.count > 1 ? "students" : "student"}"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      # input students
      @students = input_students
    when "2"
      # show the students
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu

# students_by_cohort = {}

# students.each do |student|
#   month = student[:cohort]
#   name = student[:name]
#   if students_by_cohort[month].nil?
#     students_by_cohort[month] = [name]
#   else
#     students_by_cohort[month].push(name)
#   end
# end

# students_by_cohort.each do |cohort, names|
#   puts cohort
#   puts names
# end