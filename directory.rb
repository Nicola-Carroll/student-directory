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
@months = [
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

def update_student_list(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Name?"
  name = STDIN.gets.chomp

  while !name.empty? do
    puts "Cohort?"
    cohort = STDIN.gets.chomp
    
    while !@months.include?(cohort) do
      if cohort.empty?
        cohort = 'november'
      else
        puts "cohort misspelt, please try again"
        cohort = STDIN.gets.chomp
      end
    end

    update_student_list(name, cohort)
    puts "Now we have #{@students.count} #{@students.count == 1 ? "student" : "students"}"

    puts "Name?"
    name = STDIN.gets.chomp
  end

  @students
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
    puts "Overall, we have #{@students.count} great #{@students.count == 1 ? "student" : "students"}"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a csv"
  puts "4. Load the list from a csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students(filename)
  file = File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Students saved"
end

def load_students(filename)
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      update_student_list(name, cohort)
    end
  end
  puts "Students loaded"
end

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def process_menu_selection(selection)
  case selection
    when "1"
      puts "Please enter the name and cohort if known of the students"
      puts "To finish, just hit return twice"
      input_students
    when "2"
      show_students
    when "3"
      puts "What filename? Required format: ***.csv"
      filename = gets.chomp
      save_students(filename)
    when "4"
      puts "What filename? Required format: ***.csv"
      filename = gets.chomp
      load_students(filename)
    when "9"
      puts "Goodbye!"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process_menu_selection(STDIN.gets.chomp)
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