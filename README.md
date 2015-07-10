# Remarkymark

A convenient Middleman app for indexing, styling, navigating & displaying your [Remark.js](http://remarkjs.com/) slideshows!

- clone this repo
- `bundle`
- make a new remark file, e.g. `/source/remarks/example.remark`
- `middleman`

Navigate to `http://localhost:4567` to see an index of all of your Remark.js slideshows.

Remark Markdown authoring guide: https://github.com/gnab/remark/wiki/Markdown

## Custom stylesheets

Add `!!! STYLESHEET_NAME` to the top of your `.remark` file to link a custom stylesheet (Remarkymark defaults to the `default` stylesheet otherwise). There's an example custom slideshow in the repo.
