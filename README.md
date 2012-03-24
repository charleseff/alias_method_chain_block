the functionality I'm looking for is something like this:



class SomeObject
  def do_stuff
    puts "doing stuff"
  end
end

extra_stuff = -> do
  do_stuff_without_extra_stuff
  puts "doing extra stuff"
end


some_object = SomeObject.new

alias_method_chain_block(SomeObject, :do_stuff, :extra_stuff) do
  some_object.do_stuff
end

some_object.do_stuff


Output:

doing stuff
doing extra stuff
doing stuff