class Proverb
  LINES = { couplet: 'For want of a {{name}} the {{next_name}} was lost.',
            last: 'And all for the want of a {{name}}.' }.freeze

  def initialize(*args)
    @qualifier, @characters = args.flatten.partition { |arg| arg.is_a?(Hash) }
    @qualifier = @qualifier.empty? ? '' : @qualifier[0][:qualifier] + ' '
  end

  def to_s
    @characters.each_with_index.with_object([]) do |(name, index), song|
      song.push(subst(:last, name: @qualifier + name)) if song.empty?
      next_name = @characters[index + 1]
      song.insert(-2, subst(:couplet, name: name, next_name: next_name)) if next_name
    end.join("\n")
  end

  private

  def subst(key, values)
    return nil unless LINES.key?(key)
    line = LINES[key]
    values.each do |k, v|
      return nil if v.nil?
      line = line.gsub(Regexp.new('\{\{' + k.to_s + '\}\}'), v.to_s)
    end
    line
  end
end
