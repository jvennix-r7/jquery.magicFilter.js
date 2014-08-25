## jquery.magicInput.js

`magicInput` is a jQuery 1.9+ plugin for implementing advanced, autocompleted filters in a text input with a focus on keyboard usability.

[Demos](about:blank).

#### Usage

    $('.my-div').magicInput
      filterKeys: ['name', 'proto', 'port', 'host.name', 'host.addr']
      suggestValue: (key, partialValue) ->

#### License

`magicInput` is released under the MIT License.

#### Development

You'll need nodejs and npm installed on your machine. To set up a build environment, you'll need bower and grunt. If you don't have them installed:

    $ sudo npm i -g grunt-cli
    $ sudo npm i -g bower

Then install all the dev dependencies:

    $ npm i
    $ bower i

Now you can build:

    $ bower build

Or run specs:

    $ bower spec

To set up a watch script to build and run specs on file change:

    $ bower watch
