Gem::Specification.new do |s|
  s.name        = 'icsfilter'
  s.version     = '1.0.0'
  s.authors     = ['Kristoffer Sachse']
  s.email       = ['hello@kristoffer.is']
  s.homepage    = 'https://github.com/sachse/icsfilter'
  s.summary     = 'Basic way to filter events in ics files'
  s.description = 'icsfilter provides a basic way to filter events or change wording in ics files using the command line.'

  s.add_dependency('icalendar', '>= 2.0')

  s.license       = 'MIT'
  s.files         = `git ls-files`.split("\n")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']
end
