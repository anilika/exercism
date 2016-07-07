class Robot
  @@names = []
  
  def initialize
    @abc = ('A'..'Z').to_a
    @numbers = (0..9).to_a
  end

  def name
    robot_name ? robot_name : new_name 
  end
  
  def reset
    @robot_name = nil
  end
  
  private

  def new_name
    until unique?
      @robot_name = (abc.shuffle[0,2] + numbers.shuffle[0,3]).join
    end
    @@names << robot_name
    robot_name
  end
  
  def unique?
    robot_name == nil || @@names.include?(robot_name) ? false : true  
  end
    
  attr_reader :abc, :numbers, :robot_name
end
