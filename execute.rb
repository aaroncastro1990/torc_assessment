require_relative 'lib/cart'

input_1 = File.readlines("./inputs/input_1.txt")
input_2 = File.readlines("./inputs/input_2.txt")
input_3 = File.readlines("./inputs/input_3.txt")

# Input 1:
puts "Output 1:"
puts Cart.new(input_1).receipt_details
puts "\n"

# Input 2:
puts "Output 2:"
puts Cart.new(input_2).receipt_details
puts "\n"

# Input 3:
puts "Output 3:"
puts Cart.new(input_3).receipt_details
puts "\n"

########################################
############ Custom input ##############

file_path = "your_awesome_file_path"

if File.exists?(file_path)
  your_file = File.readlines(file_path)

  puts "Custom Output:"
  puts Cart.new(your_file).receipt_details
  puts "\n"
end