module.exports = (grunt) ->
    # Project configuration.
    grunt.initConfig
        pkg: grunt.file.readJSON('package.json')
        uglify:
            options:
                banner: "/*! <%= pkg.name %> <%= grunt.template.today('yyyy-mm-dd') %>*/\n" +
                        "/*! Version: <%= pkg.version %> */\n" +
                        "/*! License: BSD */\n"

                mangle: false
                report: "min"

            build:
                files:
                    'dist/coffeeColorPicker.min.js': 'dist/coffeeColorPicker.js'

        coffee:
            dev:
                files:
                    'dist/coffeeColorPicker.js': 'coffeeColorPicker.coffee',

        coffeelint:
            app:
                files:
                    src: ['coffeeColorPicker.coffee']
                options:
                    max_line_length:
                        value: 120
                        level: "error"
                    indentation:
                        value: 4
                        level: "error"

        watch:
            checksley:
                tasks: ['coffee']
                files: [
                    'coffeeColorPicker.coffee'
                ]

        clean: [
            'dist/*.js'
        ]


    # Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-uglify')
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-contrib-watch')
    grunt.loadNpmTasks('grunt-contrib-clean')
    grunt.loadNpmTasks('grunt-coffeelint')

    # Default task(s).
    grunt.registerTask('default', ['coffee', 'watch'])
    grunt.registerTask('dist', ['coffee', 'uglify'])
    grunt.registerTask('lint', ['coffeelint'])
