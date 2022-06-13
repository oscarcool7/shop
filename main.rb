require_relative "lib/product"
require_relative "lib/movie"
require_relative "lib/book"
require_relative "lib/disk"
require_relative "lib/product_collection"

collection = ProductCollection.from_dir("#{__dir__}/data")

sum = 0
purchases = []

until collection.empty?
  user_input = -1
  until user_input.between?(0, collection.to_a.size)
    puts "What do you want to buy?"
    puts

    collection.to_a.each.with_index(1) do |product, index|
      puts "#{index}. #{product}"
    end
    puts "0. Exit"
    puts

    user_input = STDIN.gets.to_i
    puts
  end

  if user_input == 0
    puts "Your purchases:"
    puts
    puts purchases
    puts "\nTotal amount - #{sum}$. Thanks for shopping!"
    abort
  end

  purchase = collection.to_a[user_input - 1]
  purchase.amount -= 1

  if purchase.amount == 0
    collection.delete_product(purchase)
  end

  purchases << purchase
  purchases = purchases.uniq
  sum += purchase.price

  puts "Your choice: #{purchase}"
  puts
  puts "Total amount: #{sum}$"
  puts
end

puts "The store is empty! Your purchases:"
puts
puts purchases
puts "\nTotal amount - #{sum}$. Thanks for shopping!"
