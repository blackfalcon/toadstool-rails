##Creating a new UI Pattern

Create the following files/directories 

1. Create `app/views/admin/styleguide/ui_patterns/foo/_bar.html.haml`
1. Create `app/views/admin/styleguide/ui_patterns/foo/readme.md`
1. Create `app/assets/stylesheets/ui_patterns/foo/bar/_bar.sass`
	1. Create `.../ui_patterns/foo/bar/_extends.sass`
	1. Create `.../ui_patterns/foo/bar/_mixins.scss` 

###File specs
Open `app/assets/stylesheets/ui_patterns/foo/bar/_bar.sass` and add the following lines

`@import 'mixins'` and `@import 'extends'`

###Append the following to the document

`/app/assets/stylesheets/_ui_patterns.sass` needs to have

`@import 'ui_patterns/foo/bar/bar'`

###In a perfect world…
From the CLI we would be able to run a generator command like the following

`uipattern create foo bar` and it would do all this for us. That will happen some day.