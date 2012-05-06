module Paperclip
  module S3
    if defined? Rails::Railtie # Don't break rails 2.x
      require 'rails'
      class Railtie < Rails::Railtie
        initializer 'paperclip.force_s3_attachment_on_production' do
          ActiveSupport.on_load :active_record do
            Paperclip::S3::Railtie.insert
          end
        end
      end
    end

    class Railtie
      def self.insert
        in_production = false
        s3_environments = ENV['S3_ENVIRONMENTS'] ? ENV['S3_ENVIRONMENTS'].split(',') : ['production']
        if (defined?(Rails.env) && Rails.env)
          in_production = s3_environments.include?(Rails.env)
        elsif (defined?(RAILS_ENV) && RAILS_ENV)
          in_production = s3_environments.grep(RAILS_ENV)
        end

        ActiveRecord::Base.send(:include, Paperclip::S3::Glue) if in_production
      end
    end
  end
end
