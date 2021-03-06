class BikeResult < LegResult
  field :mph, type: Float

  def calc_ave
    if event && secs
      self[:mph] = event.miles * 3600 / secs
    end
  end


  def secs=(value)
    super
    calc_ave
  end
end
