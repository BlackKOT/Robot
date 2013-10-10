class Field
  attr_accessor :x_size
  attr_accessor :y_size

  def initialize (x_size = 5, y_size = 5) # field initializer with default dimension 5 x 5
    @x_size = x_size
    @y_size = y_size
  end

  def inbound?(x, y) # method for checking: true if the object in the field
    x.to_i.between?(0, @x_size) && y.to_i.between?(0, @y_size)
  end
end