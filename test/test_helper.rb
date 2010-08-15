require 'rubygems'
gem 'actionpack', '>= 3.0.0.rc'

require 'active_support'
require 'shoulda'
require 'mocha'
require 'css_views'


class Test::Unit::TestCase
  def stub_controller
    stub.tap do |controller|
      controller
    end
  end
end

class DownCaseTransformer
  def transform(css)
    css.downcase
  end
end