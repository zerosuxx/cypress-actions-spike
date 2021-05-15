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
    runtimeCompiler: true
}
