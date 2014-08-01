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

  def filter#(filters, replacements)
    filters = Regexp.union(/\AKSA \/ fri\z/, /\AKSA \/ Lukket\z/)
    replacements = Regexp.union(/\AKSA \/ /, /\AStudy Activity\,  : /)

    @events.reject! { |event| event.summary.match(filters) }
    @events.each { |event| event.summary.gsub!(replacements, '') }

    self
  end

  def publish
    File.open(@output, 'w') do |f|
     f.write(@calendar.to_ical)
    end
  end
end
