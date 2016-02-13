module ApplicationHelper

  def format_hours secs
    Time.at(secs).utc.strftime("%k:%M:%S") if secs
  end

  def format_minutes secs
    Time.at(secs).utc.strftime("%M:%S") if secs
  end

  def format_mph mph
    mph.round(1) if mph
  end

  def format_name(first_name, last_name)
    "#{last_name}, #{first_name}"
  end
end
