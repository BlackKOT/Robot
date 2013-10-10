path = Dir.pwd # get the current application path

require "#{path}/field.rb" # include file 'field'
require "#{path}/robot.rb" # include file 'robot'

table = Field.new # creating class object Field
robot = Robot.new(table) # creating class object Robot

def run_checked_command(command, bot) # test method of checking and launching commands for a Robot
  command = command.downcase.split(/[\s,]+/) # transforming command to downcase and splitting it into components

  if command.length > 0 && Robot.instance_methods(false).include?(command.first.to_sym) # check for empty body and the presence in the list of available commands
    if command.length == 4 # we have 1 command and 3 params ?
      if command[1].to_i.to_s == command[1] && command[2].to_i.to_s == command[2] # 2 and 3 params is numeric?
        bot.send("#{command.first}", *(command[1..2].map!(&:to_i)<< command[3].upcase!)) # send "place" command
      end
    else
      bot.send(command.first) unless command.first =='place' #send other checked commands
    end
  end
end

if File.exists?("#{path}/test_input.txt") # if test file exists
  command_array = File.read("#{path}/test_input.txt").split("\n") # reading it and splitting it into lines
  puts "Command list readed from #{path}/test_input.txt"
  if command_array.length > 0 # if list not empty
    command_array.each do |command| # sequentially for each command
      run_checked_command(command, robot) # send the command to check and execution
    end
  end
else # if test file does not exist
  loop do # infinite loop
    puts "Enter command: " # prompt for input data
    command = gets.chomp # reading data from console
    run_checked_command(command, robot) # send the command to check and execution
  end
end