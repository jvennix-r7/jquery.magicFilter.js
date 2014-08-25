(function() {
  (window.define || (function(deps, fn) {
    return fn();
  }))([], function() {
    var DEFAULTS, buildFilter;
    buildFilter = function(input, opts) {
      var update;
      if (opts == null) {
        opts = {};
      }
      return update = function() {};
    };
    DEFAULTS = {
      keys: [],
      placeholder: null,
      completeVal: function() {},
      clearBtn: true
    };
    return $.fn.magicFilter = function(opts) {
      if (opts == null) {
        opts = {};
      }
      opts = $.extend({}, DEFAULTS, opts);
      $(this).each(function(input) {
        return buildFilter(input, opts);
      });
      return this;
    };
  });

}).call(this);
