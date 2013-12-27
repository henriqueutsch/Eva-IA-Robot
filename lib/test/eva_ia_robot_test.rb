require "test/unit"
load "../eva-ia-robot.rb"

class HelloWorldTest < Test::Unit::TestCase
  def test_say_hello_to_the_world
    assert_equal "Hello World!", HelloWorld.say
  end
end