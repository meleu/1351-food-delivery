class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      @current_user = @sessions_controller.login
      logged_in_loop
    end
  end

  private

  def logged_in_loop
    while @current_user
      if @current_user.manager?
        choice = print_manager_menu
        manager_action(choice)
      else
        choice = print_driver_menu
        driver_action(choice)
      end
    end
  end

  # rubocop:disable Metrics/MethodLength
  def print_manager_menu
    puts "-- MANAGER MENU --"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Add new order"
    puts "6. List all undelivered orders"
    puts "9. Logout"
    puts "0. Exit"
    print "> "
    gets.chomp.to_i
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 9 then logout!
    when 0 then stop!
    else puts "Invalid input! Try again..."
    end
  end
  # rubocop:enable Metrics/MethodLength

  def print_driver_menu
    puts "-- DRIVER MENU --"
    puts "1. List my undelivered orders"
    puts "2. Mark order as delivered"
    puts "9. Logout"
    puts "0. Exit"
    print "> "
    gets.chomp.to_i
  end

  def driver_action(choice)
    case choice
    when 1 then @orders_controller.list_my_orders(@current_user)
    when 2 then @orders_controller.mark_as_delivered(@current_user)
    when 9 then logout!
    when 0 then stop!
    else puts "Invalid input! Try again..."
    end
  end

  def logout!
    @current_user = nil
  end

  def stop!
    @running = false
    logout!
    puts "See you next time!"
  end
end
