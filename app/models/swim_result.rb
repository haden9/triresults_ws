class SwimResult < LegResult
  field :pace_100, type: Float

  def calc_ave
    if event && secs
      self[:pace_100] = secs / (event.meters / 100)
    end
  end

  def secs=(value)
    super
    calc_ave
  end
end
