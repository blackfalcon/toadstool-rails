module StyleguideSpecHelper

  def relative_to_full_module_path(*path_parts)
    File.join(Styleguide::Modules.directory, path_parts)
  end

  def relative_to_full_pattern_path(*path_parts)
    File.join(Styleguide::Patterns.directory, path_parts)
  end

  def styleguide_module_from_relative_path(*path_parts)
    Styleguide::Module.new(relative_to_full_module_path(path_parts))
  end

  def styleguide_pattern_from_relative_path(*path_parts)
    Styleguide::Pattern.new(relative_to_full_pattern_path(path_parts))
  end
end
