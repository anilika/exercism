class CustomSet
  include Comparable
  attr_reader :nodes

  def initialize(*elements)
    @nodes = elements.flatten.uniq.map { |element| Node.new(element) }.sort
  end

  def add(element)
    if @nodes.select { |node| node.data == element }.empty?
      @nodes.push(Node.new(element))
      @nodes = @nodes.sort
    end
    self
  end

  def intersection(other)
    CustomSet.new(other.nodes.select { |node| member?(node.data) }.map(&:data))
  end

  def difference(other)
    CustomSet.new(nodes.reject { |node| other.member?(node.data) }.map(&:data))
  end

  def union(other_set)
    CustomSet.new((nodes + other_set.nodes).uniq.map(&:data))
  end

  def empty?
    @nodes.size.zero?
  end

  def member?(other_element)
    @nodes.any? { |node| node.data == other_element }
  end

  def subset?(other)
    nodes.all? do |node|
      other.nodes.member?(node)
    end
  end

  def disjoint?(other)
    nodes.all? do |node|
      other.nodes.member?(node) == false
    end
  end

  def <=>(other)
    nodes <=> other.nodes
  end
end

class Node
  include Comparable
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def <=>(other)
    data <=> other.data
  end
end
