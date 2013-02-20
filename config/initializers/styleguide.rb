Dir[Rails.root.join('lib', 'styleguide', '*.rb')].sort { |a,b| a <=> b }.each do |file|
  path = Pathname.new(file)
  require File.join(path.dirname, File.basename(file, File.extname(file)))
end
