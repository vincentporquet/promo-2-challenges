def tag(tag_name, attr = nil)
  #TODO:  Build HTML tags around  content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  if attr == nil
    "<#{tag_name}>#{yield}</#{tag_name}>"
  else
    "<#{tag_name} #{attr[0]}='#{attr[1]}'>#{yield}</#{tag_name}>"
  end
end

def timer_for
  #TODO:  Return time taken to execute the given block
  puts "début du Block"
  start = Time.now

  yield

  puts "fin du Block"
  the_end = Time.now

  the_end - start
end

duration = timer_for  do
  sleep(5)
end

puts duration

def transform(element)
  #TODO:  Simply execute the given block on element
  yield(element)
end

transform(6) do |el|
  el + 7
end

tag("h1") do
  "test"
end


%w(a b e i).select do |letter|
  letter == "a"
end











