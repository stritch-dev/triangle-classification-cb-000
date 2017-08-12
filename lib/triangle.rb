# identify triangles
class Triangle
  attr_accessor :sides, :invalid
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    scalene || equilateral || isosceles
  end

  def invalid?
    [@a, @b, @c].any? { |x| x <= 0 } || @a + @b <= @c || @a + @c <= @b || @b + @c <= @a
  end

  def kind
    if invalid?
      begin
        raise TriangleError
      end
    end
    @kind
  end

  def scalene
    [@a, @b, @c].uniq!.nil? && @kind = :scalene
  end

  def equilateral
    @a == @b && @b == @c && @kind = :equilateral
  end

  def isosceles
    (@a == @b || @b == @c || @c == @a) && @kind = :isosceles
  end
end

class TriangleError < StandardError
  def message
    'This is not a triangle'
  end
end
