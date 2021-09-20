var assert = require('assert');
var fs = require('fs');

describe('Test Suite', function() {
  describe('Test if index.html file exists', function() {
    it('Should fail if the index.html is not present', function() {
      assert.strictEqual(fs.existsSync('./src/index.html'), true);     
    });
  });
});

