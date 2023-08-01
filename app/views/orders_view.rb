class OrdersView
  def display_orders(orders)
    if orders.empty?
      puts "No orders to be displayed..."
      return false
    end

    puts "List of orders:"
    orders.each_with_index do |order, index|
      puts "#{index + 1}. '#{order.employee.username}' must deliver '#{order.meal.name}' to '#{order.customer.name}'"
    end
    puts
  end

  def ask_user_for_index
    puts "index?"
    print "> "
    gets.chomp.to_i - 1
  end
end
