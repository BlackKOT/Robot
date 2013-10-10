class Robot

  # properties: x,y,face,field
  attr_accessor :x_place, :y_place, :face, :field

  # hash with move directions for cardinal direction
  COMPASS = {'NORTH' => {:x => 0, :y => 1},
             'EAST' => {:x => 1, :y => 0},
             'SOUTH' => {:x => 0, :y => -1},
             'WEST' => {:x => -1, :y => 0}
  }

  def initialize(field)
    @field = field
  end

  def place(x, y, f) # placing object method
    if @field.inbound?(x, y) && COMPASS.keys.include?(f) # if object is on field and cardinal array includes face
      @x_place = x
      @y_place = y
      @face = f
    end
  end

  def placed? # method for checking: true if the object is placed. (public access for informative)
    @x_place && @face
  end

  def move # method for moving object
    place(@x_place + COMPASS[@face][:x], @y_place + COMPASS[@face][:y], @face) if placed? # try to move object
  end

  def left # method for left rotate object
    rotate(:angle => -1) if placed?
  end

  def right # method for right rotate object
    rotate(:angle => 1) if placed?
  end

  def report # method for report output
    puts "Output: #{@x_place},#{@y_place},#{@face}" if placed?
  end

  private

  def rotate(params = {}) # rotating method inside compass array (angle negative - left / angle positive - right)
    @face = COMPASS.keys[(COMPASS.keys.index(@face) + params[:angle]) % COMPASS.keys.length]
  end
end