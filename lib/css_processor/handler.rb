module CssProcessor
  class Handler
    def initialize(configuration, controller)
      @configuration = configuration
      @controller = controller
    end
    
    def render
      transform(body)
    end
    
    def body
      @configuration.components.map do |view|
        @controller.send(:render_to_string, view)
      end.join("\n")
    end
    
    def last_modified
      template_files.map {|f| File.mtime(f) }.max
    end
    
    def etag
      template_files.map {|f| File.mtime(f) }
    end
    
    def transform(css)
      if transformers = @configuration.transformers
        transformers.each do |transformer|
          css = transformer.transform(css)
        end
      end
      css
    end
    
    private
      def lookup_context
        @controller.send(:lookup_context)
      end
      
      def template_files
        @template_files ||= @configuration.components.map do |name|
          lookup_context.find(name, "stylesheets", false).identifier
        end
      end
      
  end
end