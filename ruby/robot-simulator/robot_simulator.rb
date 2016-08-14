class Robot
  DIRECTIONS = [:north, :east, :south, :west].freeze
  attr_reader :bearing, :coordinates

  def initialize
    @bearing = nil
    @coordinates = nil
  end

  def orient(bearing)
    raise ArgumentError unless DIRECTIONS.include?(bearing)
    @bearing = bearing
  end

  def turn_right
    index_new_bearing = DIRECTIONS.index(@bearing) + 1
    index_new_bearing -= DIRECTIONS.size if index_new_bearing >= DIRECTIONS.size
    @bearing = DIRECTIONS[index_new_bearing]
  end

  def turn_left
    index_new_bearing = DIRECTIONS.index(@bearing) - 1
    @bearing = DIRECTIONS[index_new_bearing]
  end

  def at(*coordinates)
    @coordinates = coordinates
  end

  def advance
    case bearing
    when :north then @coordinates[1] += 1
    when :south then @coordinates[1] -= 1
    when :east then @coordinates[0] += 1
    when :west then @coordinates[0] -= 1
    end
  end
end

class Simulator
  INSTRUCTIONS = { 'L' => :turn_left,
                   'R' => :turn_right,
                   'A' => :advance }.freeze

  def instructions(short_instructions)
    short_instructions.chars.map do |short_instruction|
      INSTRUCTIONS[short_instruction]
    end
  end

  def place(robot, settings)
    robot.orient(settings[:direction])
    robot.at(settings[:x], settings[:y])
  end

  def evaluate(robot, short_instructions)
    instructions(short_instructions).each { |command| robot.send(command) }
  end
end
