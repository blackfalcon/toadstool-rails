class Admin::Styleguide::ExamplesController < Admin::AdminController

  layout 'styleguide'

  def show
    @example = Styleguide::FileLocator.get(params[:example], params[:format])
    @data = Styleguide::Fixtures.get(params[:example]) if module?
  end

  private

  def module?
    params[:format] == 'module'
  end
end
