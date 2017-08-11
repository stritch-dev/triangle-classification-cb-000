require 'pry'

# identify triangles
class Triangle
  attr_accessor :sides, :invalid
  def initialize(a, b, c)
    invalid?(a, b ,c)      || 
    scalene(a, b ,c)     || 
    equilateral(a, b ,c) || 
    isosceles(a, b ,c)
  end

  def invalid?(a, b, c)
    invalid = false
    puts "======>"
    puts [a,b,c].any? {|x| x<= 0} 
    puts "<====="
    #reebinding.pry
    if [a,b,c].any? {|x| x<= 0} 
      invalid = true
    else
      if a+b <= c || a+c <= b || b+c <= a
        invalid = true
      end
    end
    if invalid
      begin
       raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    end
    @invalid = invalid
  end

  def kind
    puts 'entring kind +++++++++'
    if invalid
      begin
       raise TriangleError
      end
    end
    @kind
  end

  def scalene(a, b, c)
    [a, b, c].uniq!.nil? && @kind = :scalene
  end

 def equilateral(a, b, c)
   a == b && b == c && @kind = :equilateral
 end

 def isosceles(a, b, c)
    (a == b || b == c || c == a) && @kind = :isosceles
 end
end

class TriangleError < StandardError
  def message
   'not this'
  end
end
