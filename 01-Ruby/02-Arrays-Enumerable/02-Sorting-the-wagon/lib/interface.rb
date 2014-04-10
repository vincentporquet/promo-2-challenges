require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name

  # TODO: Add the name we just got to the students array
  students << name if name != ""

end while name != ""

# TODO: Call `wagon_sort` method and display the sorted student list

my_students = wagon_sort(students)
last_student = my_students.last
first_students = my_students[0..-2].join(", ")

puts "Congratulations! Your Wagon has #{students.length} students:
- #{first_students} and #{last_students}"
