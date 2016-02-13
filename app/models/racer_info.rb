class RacerInfo
  include Mongoid::Document
  field :racer_id, as: :_id
  field :_id, default: -> {racer_id}
  field :fn, type: String, as: :first_name
  field :ln, type: String, as: :last_name
  field :g, type: String, as: :gender
  field :yr, type: Integer, as: :birth_year
  field :res, type: Address, as: :residence

  embedded_in :parent, polymorphic: true

  validates :first_name, :last_name, :gender, :birth_year, presence: true
  validates :gender, inclusion: {in: %w{F M}, message: 'must be M or F'}
  validates :birth_year, numericality: {less_than: Date.current.year, message: 'must be in past'}

  ATTRIBUTES = ['city', 'state']

  ATTRIBUTES.each do |action|
    define_method("#{action}") do
      self.residence ? self.residence.send("#{action}") : nil
    end

    define_method("#{action}=") do |name|
      object = self.residence ||= Address.new
      object.send("#{action}=", name)
      self.residence = object
    end
  end
end
