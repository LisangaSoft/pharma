//configuration et automatisation des taches de construction

module.exports = function (grunt) {

    grunt.initConfig({
        concat: {
            options: {
                separator: '\n',
                banner: '/*Copyrigth Lisasoft*/\n',
                footer: '/*My footer*/\n',
                stripBanners: true
            },
            dist: {
                src: ['client/modules.js', 'client/app.js', 'dist/client/templateCache.js', 'client/services/*.js', 'client/composants/*.js', 'client/directives/*.js', 'client/filtres/*.js', 'client/partials/**/*.js'],
                dest: 'dist/client/pharma.js'
            },

            final: {
                src: ['client/lib/angular.min.js', 'client/lib/angular-cookies.min.js', 'client/lib/angular-route.min.js'],
                dest: 'dist/client/vendors.js'
            }
        },

        copy: {
            main: {
                files: [

                    { expand: true, src: '**', cwd: 'server/', dest: 'dist/server/' },
                    { expand: true, src: 'index.html', cwd: 'client/', dest: 'dist/client', filter: 'isFile' },
                    { expand: true, src: 'package.json', dest: 'dist', filter: 'isFile' },
                ]
            }
        },

        clean: {
            build: ['dist/'],
            cache: ['dist/client/templateCache.js'],
            final: ['dist/client/built.js'],

        },
        angularTemplateCache: {
            options: {
                module: 'pharma',
                strict: false,
                htmlmin: {
                    collapseWhitespace: true
                }
            },

            defaultOptions: {
                cwd: 'client/',
                src: ['partials/**/*.html'],
                dest: 'dist/client/templateCache.js',
            }
        },

    });
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-angular-templatecache');

    grunt.registerTask('default', ['clean:build', 'angularTemplateCache', 'copy', 'concat:dist', 'clean:cache', 'clean:final', 'concat:final']);

}