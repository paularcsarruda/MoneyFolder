expenses = []

def display_menu
  puts("______ MoneyFolder ________")
  puts("| [1] Add Expense         |")
  puts("| [2] Remove Expense      |")
  puts("| [3] View Expenses       |")
  puts("| [4] Total Expenses      |")
  puts("| [5] Exit                |")
  puts("___________________________")
end

def add_expense(expenses)
  puts("Enter the date (yyyy-mm-dd): ")
  date = gets.chomp
  puts("Enter the description: ")
  description = gets.chomp
  puts("Enter the amount: ")
  amount = gets.chomp.to_f

  expense = { date: date, description: description, amount: amount }
  expenses << expense

  puts("Expense added successfully.")
end

def remove_expense(expenses)
  if expenses.empty?
    puts("No expenses to remove.")
    return
  end

  puts("Current Expenses:")
  expenses.each_with_index do |expense, idx|
    puts("#{idx + 1}. Date: #{expense[:date]}, Description: #{expense[:description]}, Amount: $#{expense[:amount]}")
  end

  puts("Enter the expense index to remove (1 to #{expenses.length}): ")
  index = gets.chomp.to_i

  if index.between?(1, expenses.length)
    expenses.delete_at(index - 1)
    puts("Expense removed successfully.")
  else
    puts("Invalid index. Please enter a valid index.")
  end
end

def view_expenses(expenses)
  if expenses.empty?
    puts("No expenses added yet.")
  else
    puts("List of Expenses:")
    expenses.each_with_index do |expense, idx|
      puts("#{idx + 1}. Date: #{expense[:date]}, Description: #{expense[:description]}, Amount: $#{expense[:amount]}")
    end
  end
end

def total_expenses(expenses)
  total = expenses.map { |expense| expense[:amount] }.sum
  puts("Total Expenses: $#{total}")
end

loop do
  display_menu
  puts("Enter your choice (1-5): ")
  choice = gets.chomp.to_i

  case choice
  when 1
    add_expense(expenses)
  when 2
    remove_expense(expenses)
  when 3
    view_expenses(expenses)
  when 4
    total_expenses(expenses)
  when 5
    puts("Exiting MoneyFolder. Goodbye!")
    break
  else
    puts("Invalid choice. Please enter a number from 1 to 5.")
  end
end
