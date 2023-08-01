class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
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

  def print_manager_menu
    puts "-- MANAGER MENU --"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. TODO: manager actions..."
    puts "9. Logout"
    puts "0. Exit"
    print "> "
    gets.chomp.to_i
  end

  def print_driver_menu
    puts "-- DRIVER MENU --"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. TODO: driver actions..."
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
    when 9 then logout!
    when 0 then stop!
    else puts "Invalid input! Try again..."
    end
  end

  def driver_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then logout!
    when 0 then stop!
    else puts "Invalid input! Try again..."
    end
  end

  def stop!
    @running = false
    logout!
    puts "See you next time!"
  end

  def logout!
    @current_user = nil
  end
end
