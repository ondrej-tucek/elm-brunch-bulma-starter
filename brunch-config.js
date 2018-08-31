exports.config = {
    // See http://brunch.io/#documentation for docs.

    server: {
        port: 3000
    },

    files: {
        javascripts: {
            joinTo: "js/app.js"

            // To use a separate vendor.js bundle, specify two files path
            // http://brunch.io/docs/config#-files-
            // joinTo: {
            //   "js/app.js": /^js/,
            //   "js/vendor.js": /^(?!js)/
            // }
            //
            // To change the order of concatenation of files, explicitly mention here
            // order: {
            //   before: [
            //     "vendor/js/jquery-2.1.1.js",
            //     "vendor/js/bootstrap.min.js"
            //   ]
            // }
        },
        stylesheets: {
            joinTo: {
                "css/app.css": [
                    "css/app.scss"
                ]
            },
            order: {
                after: ["_build/css/app.scss"] // concat app.css last
            }
        },
        templates: {
            joinTo: "js/app.js"
        }
    },

    conventions: {
        // This option sets where we should place non-css and non-js assets in.
        // By default, we set this to "/assets/static". Files in this directory
        // will be copied to `paths.public`, which is "priv/static" by default.
        assets: /^(static)/,
        ignored: /elm-stuff\//
    },

    paths: {
        // Dependencies and current project directories to watch
        watched: ["css", "elm", "js", "images"],
        // Where to compile files to
        public: "_build/"
    },

    // Configure your plugins
    plugins: {
        assetsmanager: {
            copyTo: {
                fonts: ['node_modules/@fortawesome/fontawesome-free/webfonts/*'],
                images: ['images/*.*(png|jpg|jpeg)']
            }
        },
        // autoReload: {
        //     enabled: {
        //       css: true,
        //       js: true,
        //       assets: false
        //     },
        elmBrunch: {
            mainModules: ['Main.elm'],
            elmFolder: 'elm',
            executablePath: '../node_modules/.bin',
            outputFolder: '../_build/js/',
            makeParameters: ['--warn', '--debug']
        },
        babel: {
            presets: [
                ['env', {
                    targets: {
                        browsers: ['last 2 versions', 'ie >= 9', 'Android >= 4.4', 'ios >= 7']
                    }
                }]
            ],
            // Do not use ES6 compiler in vendor code
            ignore: [
                /vendor/,
                'js/main.js'
            ]
        },
        postcss: {
            processors: [
                require('autoprefixer')(['last 2 versions', 'ie >= 9', 'Android >= 2.3', 'ios >= 7']),
            ]
        },
        sass: {
            options: {
                includePaths: [
                    'node_modules/bulma',
                    'node_modules/bulma-extensions',
                    'node_modules/bulma-extensions/dist/css/',
                    'node_modules/@fortawesome/fontawesome-free/scss'

                ]
            }
        }
    },

    modules: {
        autoRequire: {
            "js/app.js": ["js/app"]
        }
    },

    npm: {
        enabled: true
    },

    overrides: {
        production: {
            plugins: {
                elmBrunch: {
                    makeParameters: ['--warn']
                }
            }
        }
    }
};
