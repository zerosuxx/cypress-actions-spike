module.exports = {
    css: {
        extract: false,
    },
    configureWebpack: {
        optimization: {
            splitChunks: false
        },
        output: {
            filename: 'app.js'
        }
    },
    productionSourceMap: false,
    chainWebpack: config => {
      //config.plugins.delete('html');
      config.plugins.delete('preload');
      config.plugins.delete('prefetch');
      config.module
        .rule('images')
        .use('url-loader')
        .loader('url-loader')
        .tap(options => Object.assign(options, { limit: 10240 }))
    }
}
