require 'test_helper'

class HandlerTest < Test::Unit::TestCase 
  context "A simple handler" do
    setup do
      @controller = stub_controller
      @controller.expects(:render_to_string).with("main").returns("FAKE_BODY").once
      @configuration = CssViews::Configuration.new("test_config", :components=>["main"])
      @handler = CssViews::Handler.new(@configuration, @controller)
    end
    
    should "return the body unmodified when rendering" do
      assert_equal "FAKE_BODY", @handler.render
    end
  end
  
  context "A handler with two components" do
    setup do
      @controller = stub_controller
      @controller.expects(:render_to_string).with("main").returns("FAKE_BODY").once
      @controller.expects(:render_to_string).with("admin").returns("ADMIN_BODY").once
      @configuration = CssViews::Configuration.new("test_config", :components=>["main", "admin"])
      @handler = CssViews::Handler.new(@configuration, @controller)
    end
    
    should "return the concatenated body" do
      assert_equal "FAKE_BODY\nADMIN_BODY", @handler.render
    end
  end
  
  
  context "A handler with two components and a processor" do
    setup do
      @controller = stub_controller
      @controller.expects(:render_to_string).with("main").returns("FAKE_BODY").once
      @controller.expects(:render_to_string).with("admin").returns("ADMIN_BODY").once
      @configuration = CssViews::Configuration.new("test_config", :components=>["main", "admin"], :transformers=>[DownCaseTransformer.new])
      @handler = CssViews::Handler.new(@configuration, @controller)
    end
    
    should "return the concatenated body after transformation" do
      assert_equal "fake_body\nadmin_body", @handler.render
    end
  end
  
  
end