module Styleguide
  module Modules
    @@module_directory = File.join(Rails.root, 'app', 'views', 'application', 'modules')
    @@module_sass_directory = File.join(Rails.root, 'app', 'assets', 'stylesheets', 'modules')

    def self.directory
      Pathname.new(@@module_directory)
    end

    def self.sass_directory
      Pathname.new(@@module_sass_directory)
    end
  end
end
