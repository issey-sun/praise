// const { environment } = require('@rails/webpacker')
// const webpack = require('webpack')
// environment.plugins.prepend('Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     Popper: 'popper.js'
//   })
// )

// module.exports = environment



// const webpack = require('webpack')
// environment.plugins.prepend(
//   'Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     Popper: 'popper.js'
//   })
// )
// // ここまで

// module.exports = environment


const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
  })
)

module.exports = environment