class SessionsView
  def ask_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong credentials! Try again."
  end

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end
end
