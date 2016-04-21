require 'active_support/concern'
module Purgatory
  extend ActiveSupport::Concern

  class_methods do
    def convert_modules
      Dir[Rails.root.join("app/purgatory_challenges/*.rb")].each { |mod| include convert_module(mod) }
    end

    def convert_module(mod)
      mod.split("/").last.gsub(".rb","").capitalize.constantize
    end
  end
end
