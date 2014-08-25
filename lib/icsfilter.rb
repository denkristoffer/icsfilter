require 'icalendar'
require 'open-uri'

class ICSFilter
  def initialize(calendar, output = nil)
    calendar_file = open(calendar)
    calendars = Icalendar.parse(calendar_file)
    @calendar = calendars.first
    @events = @calendar.events
    @output = output ? output : calendar
  end

  def filter(filters)
    @events.reject! { |event| event.summary.match(filters) }

    self
  end

  def replace(targets, substitute = '')
    @events.each { |event| event.summary.gsub!(targets, substitute) }

    self
  end

  def publish
    File.open(@output, 'w') do |f|
     f.write(@calendar.to_ical)
    end
  end
end
