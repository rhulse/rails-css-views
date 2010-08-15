module CssViews
  module ControllerMixins
    extend ActiveSupport::Concern
    included do
      cattr_accessor :configurations
      self.configurations = {}
      caches_page :show
    end
    
    module ClassMethods
      def css_configuration(name, options)
        self.configurations[name.to_s] = Configuration.new(name, options)
      end
    end
    
    module InstanceMethods
      def show
        configuration = self.class.configurations[params[:configuration_name]]
        head :not_found unless configuration
        
        handler = configuration.handler(self)
        
        fresh_when(:etag=>handler.etag, :last_modified=>handler.last_modified, :public=>true)

        unless performed?
          if params[:cache_buster]
            response.headers['Cache-Control']= 'public, max-age=131557600'
            response.headers['Expires'] = 10.years.from_now.httpdate
          end
          render :text=>handler.render, :type=>Mime::CSS 
        end
      end
    end
  end
end