module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    clean:
      src: ['build']

    coffee:
      source:
        options:
          sourceMap: true
        expand: true
        cwd: 'src/'
        src: ['**/**.coffee']
        dest: 'build/'
        ext: '.js'

      spec:
        options:
          sourceMap: true
        expand: true
        cwd: 'spec'
        src: ['**/**.coffee']
        dest: 'build/spec/'
        ext: '.js'

    watch:
      files: ['src/**/**.coffee', 'spec/**/**.coffee']
      tasks: ['spec']

    jasmine:
      run:
        options:
          vendor: [
            'bower_components/jquery/dist/jquery.js'
            'build/magicFilter.js'
          ]
          specs: ['build/spec/**.js']
          summary: true

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-jasmine')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-clean')

  grunt.registerTask('style', ['clean', 'compass'])
  grunt.registerTask('build', ['clean', 'coffee'])
  grunt.registerTask('spec',  ['build', 'jasmine'])
  grunt.registerTask('default', ['build'])
