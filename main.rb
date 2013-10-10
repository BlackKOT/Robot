path = Dir.pwd # получаем текущий путь приложения

require "#{path}/field.rb" # подключаем файл
require "#{path}/robot.rb" # подключаем файл robot

table = Field.new # создаем объект класса Field
robot = Robot.new(table) # создаем объект класса Robot

def run_checked_command(command, bot) # тестовый метод проверки и запуска команд для робота
  command = command.downcase.split(/[\s,]+/) # преобразуем команду в нижний регистр и делим на составляющие

  # проверяем на пустое тело команды и на наличие в списке доступных команд
  if command.length > 0 && Robot.instance_methods(false).include?(command.first.to_sym)
    if command.length == 4 # пришла команда и 3 параметра ?
      if command[1].to_i.to_s == command[1] && command[2].to_i.to_s == command[2] # 2 и 3 параметры - числа?
        bot.send("#{command.first}", *(command[1..2].map!(&:to_i)<< command[3].upcase!)) # передаем "place" команду
      end
    else
      bot.send(command.first) unless command.first =='place' # передаем другие проверенные команды
    end
  end
end

if File.exists?("#{path}/test_input.txt") # если файл существует
  command_array = File.read("#{path}/test_input.txt").split("\n") # читаем его и делим на строки
  puts "Command list readed from #{path}/test_input.txt"
  if command_array.length > 0 # если файл не пустой
    command_array.each do |command| # последовательно для каждой команды
      run_checked_command(command, robot) # передаем команду на проверку и выполнение для обьекта robot
    end
  end
else # если файла нет
  loop do # бесконечный цикл
    puts "Enter command: " # приглашение для  ввода команды
    command = gets.chomp # читаем до ENTER
    run_checked_command(command, robot) # передаем команду на проверку и выполнение для обьекта robot
  end
end