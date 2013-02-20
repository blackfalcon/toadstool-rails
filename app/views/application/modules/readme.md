##Creating a new Module

Create the following files/directories

1. Create `app/views/application/modules/foo/_bar.html.haml`
1. Create `app/views/application/modules/foo/readme.md`
1. Create `app/assets/stylesheets/modules/foo/bar/_bar.sass`
	1. Create `.../modules/foo/bar/_extends.sass`
	1. Create `.../modules/foo/bar/_mixins.scss` 

###File specs
Open `app/assets/stylesheets/modules/foo/bar/_bar.sass` and add the following lines

`@import 'mixins'` and `@import 'extends'`

###Append the following to the document

`/app/assets/stylesheets/_modules.sass` needs to have

`@import 'modules/foo/bar/bar'`

###In a perfect world…
From the CLI we would be able to run a generator command like the following

`module create foo bar` and it would do all this for us. That will happen some day.
