#Step-by-step process for adding Toadstool to a project

Sorry for the mess here. This process is 100% manual and not awesome, but here it is. The process is to clone this project along side the project you want to install Toadstool into. Then follow the steps to move code from this repo to your rails project. 
Good luck ;)

###Javascripts
1. mv ../toadstool-rails/app/assets/javascripts/toadstool-nav.js app/assets/javascripts/
1. mv ../toadstool-rails/app/assets/javascripts/toadstool.js.coffee app/assets/javascripts/

###Sass style guide
1. mv ../toadstool-rails/app/assets/stylesheets/ app/assets/

###Admin controller
1. mv ../toadstool-rails/app/controllers/admin/ app/controllers/

###Toadstool helpers
1. mv ../toadstool-rails/app/helpers/styleguide_helper.rb app/helpers/

###Toadstool views
1. mv ../toadstool-rails/app/views/admin/ app/views/
1. mv ../toadstool-rails/app/views/layouts/styleguide.html.haml app/views/layouts/

###Toadstool config
1. mv ../toadstool-rails/config/initializers/styleguide.rb config/initializers/

###Routes - add the following lines to config/routes.rb
```ruby
  namespace :admin do
    ['color_palettes', 'forms', 'grids', 'typography', 'modules', 'patterns'].each do |action|
      get "/styleguide/#{action}" => "styleguide##{action}"
    end
    get '/styleguide' => 'styleguide#typography'

    get '/styleguide/examples/*example' => 'styleguide/examples#show', as: :styleguide_example
  end
``` 

###lib
1. mv ../toadstool-rails/lib/styleguide/ lib/

###Spec
1. mv ../toadstool-rails/spec/controllers/ spec/
1. mv ../toadstool-rails/spec/lib/ spec/
1. mv ../toadstool-rails/spec/support/ spec/

###Vendor JS
1. mv ../toadstool-rails/vendor/assets/javascripts/modernizr-2.6.2-custom.js vendor/assets/javascripts/
1. mv ../toadstool-rails/vendor/assets/javascripts/prettify.js vendor/assets/javascripts/


###Manual steps
1. Had to install gem 'red carpet' -- thought that came with HAML?
1. Added the following to `app/assets/javascripts/application.js`
```
//= require_directory .
//= stub styleguide_only
```

###Need to fix
1. In rails, all files need to be `.css.sass` or `.css.scss`
1. app/helpers/styleguide_helper.rb update reference to be `.css.sass` or `.css.scss`
1. need to get all the icon automated Sass building into the Stipe gem
1. updated the ico-font support to be more generic for install on the tournament-app 



















