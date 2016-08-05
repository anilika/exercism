class Proverb
  LINES = { couplet: 'For want of a {{name}} the {{next_name}} was lost.',
            last: 'And all for the want of a {{name}}.' }.freeze

  def initialize(*args)
    @qualifier, @characters = args.flatten.partition { |arg| arg.is_a?(Hash) }
    @qualifier = @qualifier.empty? ? '' : @qualifier[0][:qualifier] + ' '
  end

  def to_s
    song = @characters.each_cons(2).map do |names|
      subst(:couplet, name: names.first, next_name: names.last)
    end
    song.push(subst(:last, name: @qualifier + @characters.first)).join("\n")
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
