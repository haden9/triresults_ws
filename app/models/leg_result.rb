class LegResult
  include Mongoid::Document
  field :secs, type: Float

  embeds_one 'event', as: :parent
  embedded_in 'entrant'

  validates :event, presence: true

  def calc_ave
  end

  after_initialize do |doc|
    calc_ave
  end

  def secs=(value)
    self[:secs] = value
  end
end
