class Field
  attr_accessor :x_size
  attr_accessor :y_size

  def initialize (x_size = 5, y_size = 5) # инициализатор поля с размером по умолчанию
    @x_size = x_size
    @y_size = y_size
  end

  def inbound?(x, y) # проверяем, находится ли объект в поле
    x.to_i.between?(0, @x_size) && y.to_i.between?(0, @y_size)
  end
end