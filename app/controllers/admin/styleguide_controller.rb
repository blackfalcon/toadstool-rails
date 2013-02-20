class Admin::StyleguideController < Admin::AdminController
  layout 'styleguide'

  def typography
  end

  def grids
  end

  def color_palettes
  end

  def forms
  end

  def modules
    @presenter = Styleguide::ModulesPresenter.new(Styleguide::FileLocator.modules)
  end

  def patterns
    @presenter = Styleguide::PatternsPresenter.new(Styleguide::FileLocator.patterns)
  end
end
