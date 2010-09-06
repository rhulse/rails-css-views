Gem::Specification.new do |s|
  s.name    = 'css_views'
  s.version = '0.5.1.pre'
  s.email   = "michael@koziarski.com"
  s.author  = "Michael Koziarski"

  s.description = %q{Gives you helpers and the like when composing stylesheets}
  s.summary     = %q{Simple Controller support}
  s.homepage    = %q{http://www.radionz.co.nz/}

  s.add_dependency('actionpack', '>= 3.0.0')

  s.files = Dir['lib/**/*']
  s.require_path = 'lib'
end