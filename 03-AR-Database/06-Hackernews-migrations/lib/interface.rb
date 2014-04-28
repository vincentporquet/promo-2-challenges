require_relative 'config/application'
require_relative 'crud'


def ask_and_get(param)
  puts "What is the #{param} of your piece of news?"
  gets.chomp
end


db = SQLite3::Database.new(DB_PATH.to_s)

while true

  puts "Hey you, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Delete one post"
  puts "5. Exit"

	choice =  gets.chomp.to_i

	case choice
  when 1
    name = ask_and_get("name")
    source_url = ask_and_get("source url")
    rating = ask_and_get("rating")
    post = { name: name, source_url: source_url, date: Time.now, rating: rating }
    create_post(db, post)
  when 2
    get_posts(db).each do |p|
      puts "the name of the post is #{p[1]}"
    end
    #TODO: prints nicely the results from DB queries (you could use #strftime to format datetime display)
  when 3
    delete_posts(db)
      puts "all posts have been deleted !"

  when 4
    puts "What is the ID of the post ?"
    id = gets.chomp
    delete_post(db, id)

  #TODO: add other CRUD tasks to your interface if you wish!
  when 5
    break
	end

end

