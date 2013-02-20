SavageLovecast::Application.routes.draw do
  namespace :admin do
    ['color_palettes', 'forms', 'grids', 'typography', 'modules', 'patterns'].each do |action|
      get "/styleguide/#{action}" => "styleguide##{action}"
    end
    get '/styleguide' => 'styleguide#typography'

    get '/styleguide/examples/*example' => 'styleguide/examples#show', :as  => :styleguide_example
  end
end

