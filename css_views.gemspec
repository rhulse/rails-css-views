Gem::Specification.new do |s|
  s.name    = 'css_views'
  s.version = '0.5.3'
  s.email   = "michael@koziarski.com"
  s.author  = "Michael Koziarski"

  s.description = %q{Allow you to create css.erb views, and use helpers and the like in them}
  s.summary     = %q{Simple Controller support}
  s.homepage    = %q{https://github.com/rhulse/rails-css-views}

  s.add_dependency('actionpack', '>= 3.0.0')

  s.files = Dir['lib/**/*']
  s.require_path = 'lib'
end