class Address
  attr_accessor :city, :state, :location

  def initialize(city=nil,state=nil,location=nil)
    @city = city
    @state = state
    if location && location.present?
      @location =  Point.new(location[:coordinates][0], location[:coordinates][1])
    else
      @location = location
    end
  end

  def mongoize
    {city: @city, state: @state, loc: Point.mongoize(@location)}
  end

  def self.mongoize(object)
   case object
   when Address then
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
      Address.new(object[:city], object[:state], object[:loc])
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
