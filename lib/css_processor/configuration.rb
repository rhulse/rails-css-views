module CssProcessor
  class Configuration
    def initialize(name, options)
      @name = name
      @options = options
    end
    
    def components
      @options[:components]
    end
    
    def transformers
      @options[:transformers]
    end
    

    def handler(controller)
      Handler.new(self, controller)
    end
  end
end