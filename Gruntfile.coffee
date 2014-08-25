fs = require('fs')

module.exports = (grunt) ->

  grunt.registerTask 'addVersion', 'Stamps the version into the built/minified js', ->
    for f in ['dist/jquery.magicFilter.js', 'dist/jquery.magicFilter.min.js']
      fs.writeFileSync(f, fs.readFileSync(f).toString().replace(@magic, @version))
    grunt.log.writeln('Added version to both build files')
    true

  pkgJson = grunt.file.readJSON('package.json')

  grunt.initConfig

    pkg: pkgJson

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

      dist:
        preserveComments: true
        options:
          sourceMap: false
        expand: false
        src: 'src/magicFilter.coffee'
        dest: 'dist/jquery.magicFilter.js'

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

    uglify:
      options:
        sourceMap: false
        mangle: true
        preserveComments: 'some'
      dist:
        files:
          'dist/jquery.magicFilter.min.js': ['build/magicFilter.js']

    addVersion:
      dist:
        magic: '{VERSION}'
        version: pkgJson.version

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-jasmine')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-uglify')

  grunt.registerTask('build', ['clean', 'coffee:source'])
  grunt.registerTask('dist',  ['build', 'coffee:dist', 'uglify', 'addVersion'])
  grunt.registerTask('spec',  ['build', 'coffee:spec', 'jasmine'])
  grunt.registerTask('default', ['build'])
