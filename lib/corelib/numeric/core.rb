class Numeric

  #Assumes numeric value is in seconds
  def to_days_hours_minutes_seconds
    total_seconds = self.to_i

    days = total_seconds / 86400
    hours = (total_seconds / 3600) - (days * 24)
    minutes = (total_seconds / 60) - (hours * 60) - (days * 1440)
    seconds = total_seconds % 60

    display = ''
    display_concat = ''
    if days > 0
      display = display + display_concat + "#{days}d"
      display_concat = ' '
    end
    if hours > 0 || display.length > 0
      display = display + display_concat + "#{hours}h"
      display_concat = ' '
    end
    if minutes > 0 || display.length > 0
      display = display + display_concat + "#{minutes}m"
      display_concat = ' '
    end
    display = display + display_concat + "#{seconds}s"
    display
  end

  #Assumes numeric value is in seconds
  def to_hours_minutes(if_zero="")
    total_seconds = self.to_i

    return if_zero if total_seconds < 60

    hours = (total_seconds / 3600)
    minutes = (total_seconds / 60) - (hours * 60)

    display = ''
    display_concat = ''

    if hours > 0
      display = display + "#{hours}h"
      display_concat = ' '
    end
    if minutes > 0 || display.length > 0
      display = display + display_concat + "#{minutes}m"
    end
    display
  end
  
end
