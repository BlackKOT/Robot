class Robot

  # свойства объекта: x,y,face,field
  attr_accessor :x_place, :y_place, :face, :field

  # хеш со смещениями по полю для сторон света
  COMPASS = {'NORTH' => {:x => 0, :y => 1},
             'EAST' => {:x => 1, :y => 0},
             'SOUTH' => {:x => 0, :y => -1},
             'WEST' => {:x => -1, :y => 0}
  }

  def initialize(field)
    @field = field
  end

  def place(x, y, f) # метод размещения объекта
    if @field.inbound?(x, y) && COMPASS.keys.include?(f) # если объект попадает в поле и массив сторон света включает фейс
      @x_place = x
      @y_place = y
      @face = f
    end
  end

  def placed? # метод-проверка: размещен ли объект, доступен извне, как вспомагательный
    @x_place && @face
  end

  def move # метод для перемещения обьекта
    place(@x_place + COMPASS[@face][:x], @y_place + COMPASS[@face][:y], @face) if placed? # пробуем переместить обьект
  end

  def left # метод для поворота объекта налево
    rotate(:angle => -1) if placed?
  end

  def right # метод для поворота объекта направо
    rotate(:angle => 1) if placed?
  end

  def report # метод для вывода отчета
    puts "Output: #{@x_place},#{@y_place},#{@face}" if placed?
  end

  private

  def rotate(params = {}) # метод вращения по кругу в массиве (angle negative - left / angle positive - right)
    @face = COMPASS.keys[(COMPASS.keys.index(@face) + params[:angle]) % COMPASS.keys.length]
  end
end