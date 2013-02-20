See following instruction to add/edit/delete icons to the icon-font library.

1. Go to [IcoMoon](http://icomoon.io/app/)
	1. click the `save/load` action in the lower right 
	1. upload the `.json` file
	1. go to `/app/assets/stylesheets/typography/` 
	1. grab `ico-fonts.json`
1. Add/edit/delete ico-fonts
1. Download 
	1. new font library 
	1. new `.json` file
1. Place newly generated font libraries into `/public/fonts` 
1. Place newly generated `.json` file in `/app/assets/stylesheets/typography/` 
1. Open `app/views/admin/styleguide/ui_patterns/typography/_ico_fonts.html.haml` and add new names values to `icons` variable list
1. Open `app/assets/stylesheets/typography/_ico-fonts.scss` and add new name PUA to `$icons` variable list
1. __profit__

Set family in `_config.scss`, `$icon_font_alpha: #{'ico-fonts'}`