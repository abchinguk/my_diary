puts "Приветб я твой дневник. Скажи мне, что у тебя на уме ?"
puts "Я сохраню всё, что ты напишешь до строчки \"end\" в файл."
puts


# определим папку, в которой лежит эта программа "read_list"
# с помощью специального служебного объекта Ruby __FILE__
current_path = File.dirname(__FILE__) # путь к текущей папке откуда выполняется программа

line = nil
all_lines = []

while line != "end" do
	line = STDIN.gets.encode("UTF-8").chomp
	all_lines << line
end

time = Time.now

file_name = time.strftime("%Y-%m-%d") # YYYY-MM-DD

time_string = time.strftime("%H:%M") # HH:MM

separator = "----------------------------"

file = File.new(current_path + "/" + file_name + ".txt", "a:UTF-8")

file.print("\n\r" + time_string + "\n\r")

all_lines.pop

for item in all_lines do
	file.puts(item)
end	

file.puts(separator)

file.close

puts "Ваша запись сохранена в файл #{file_name}.txt"
puts "Запись сделана в #{time_string}"
puts