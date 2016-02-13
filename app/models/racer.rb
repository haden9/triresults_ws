class Racer
  include Mongoid::Document

  ATTRIBUTES = ['first_name', 'last_name', 'gender', 'birth_year', 'city', 'state']

  embeds_one :info, class_name: 'RacerInfo', autobuild: true

  has_many :races, class_name: 'Entrant', dependent: :nullify, foreign_key: 'racer.racer_id',
    order: :'race.date'.desc

  before_create do |racer|
    racer.info.id = racer.id
  end

  ATTRIBUTES.each do |action|
    define_method("#{action}") do
      self.info ? self.info.send("#{action}") : nil
    end

    define_method("#{action}=") do |name|
      object = self.info ||= RacerInfo.new
      object.send("#{action}=", name)
      self.info = object
    end
  end
end
