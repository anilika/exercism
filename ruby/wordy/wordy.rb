class WordProblem
  OPERATIONS = { plus: '+', minus: '-',
                 multiplied_by: '*', divided_by: '/' }.freeze

  def initialize(problem)
    @problem = problem.gsub(' by', '_by')[0...-1].split[2..-1]
  end

  def answer
    raise ArgumentError unless valid?
    result = @problem.first
    @problem[1..-1].each_slice(2) do |pair|
      pair[0] = OPERATIONS[pair[0].to_sym]
      result.replace(eval(result + pair.join).to_s)
    end
    result.to_i
  end

  private

  def valid?
    @problem.all? do |bit|
      OPERATIONS.include?(bit.to_sym) || bit.gsub(/[-0-9]/, '').empty?
    end
  end
end
