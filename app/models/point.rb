class Point
  attr_accessor :longitude, :latitude

  def initialize(longitude=nil,latitude=nil)
    @longitude = longitude
    @latitude = latitude
  end

  def mongoize
    {type: "#{self.class}", coordinates: [@longitude, @latitude]}
  end

  def self.mongoize(object)
    case object
    when Point then
      object.mongoize
    when nil then
      nil
    else
      object
    end
  end

  def self.demongoize(object)
    case object
    when Hash then
      Point.new(object[:coordinates][0], object[:coordinates][1])
    when nil then
      nil
    else
      object
    end
  end

  def self.evolve(object)
    mongoize(object)
  end
end
