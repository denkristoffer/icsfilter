require 'icalendar'
require 'open-uri'

class IcsFilter
  def initialize(calendar, output = nil)
    calendar_file = open(calendar)
    calendars = Icalendar.parse(calendar_file)
    @calendar = calendars.first
    @events = @calendar.events
    @output = output ? output : calendar
  end

  def remove(targets)
    @events.reject! { |event| event.summary.match(targets) }
  end

  def filter(targets, substitute = '')
    @events.each { |event| event.summary.gsub!(targets, substitute) }
  end

  def publish
    File.open(@output, 'w') do |f|
     f.write(@calendar.to_ical)
    end
  end
end
