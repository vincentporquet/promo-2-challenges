require_relative "../config/application"
require_relative "../models/post"
require_relative "../models/user"

# Seed you database with post data from hacker news
html_file = open("https://news.ycombinator.com/")
html_doc = Nokogiri::HTML(html_file)

posts =[]

html_doc.search("td.title > a").each do |element|
  name = element.inner_text
  source_url = element['href']
  sibling = element.parent.parent.next_sibling
    if sibling
      span = sibling.search("td.subtext > span").first

      rating = 0
      rating = span.inner_text.to_i unless span.nil?
    end

  time = Time.now
  posts << { name: name, source_url: source_url, date: time, rating: rating}
end

# And fake users using Faker gem

puts "Seeding database..."

#TODO: Your code goes here
users = []
5.times do
  users << User.create(name: Faker::Name.name, email: Faker::Internet.email)
end

posts.each do |post|
  users.sample.posts.create(post)
end
# 1. create fake users
# 2. Scrape news from https://news.ycombinator.com/ and associate posts to your existing users