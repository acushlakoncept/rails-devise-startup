const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  Rails: '@rails/ujs',
  $: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery'
}))

module.exports = environment
