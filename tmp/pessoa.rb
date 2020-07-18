class People
  @name = ""

  def initialize(name)
    @name = name
  end

  def my_name
    @name
  end
end

p1 = People.new("André")
p2 = People.new("Alves")

print p1.my_name
puts p2.my_name