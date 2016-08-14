class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.pop
  end

  def write(value)
    raise BufferFullException if full?
    @buffer.unshift(value)
  end

  def write!(value)
    read if full?
    write(value)
  end

  def clear
    @buffer.clear
  end

  private

  def full?
    @buffer.size == @size
  end
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end
