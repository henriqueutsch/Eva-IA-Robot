require "test/unit"
require '../lib/eva_ia_robot/eva-ia-robot.rb'

# require "../eva_ia_robot/eva-pergunta.rb"


class HelloWorldTest < Test::Unit::TestCase
  def test_say_hello_to_the_world
    assert_equal "Hello World!", HelloWorld.say
  end
end