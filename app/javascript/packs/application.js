/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
// import 'stylesheets/application'

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
// The path you may like to change to under `pack` that path will be `./controllers`
// but convention will be in `/app/javascript/controllers`
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

