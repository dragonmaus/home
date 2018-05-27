const { Transform } = require("stream");

function deepsort(o) {
  if (o === null) {
    return o;
  }
  switch (o.__proto__) {
    case Array.prototype:
      return (a => {
        const a2 = [];

        for (let i = 0; i < a.length; i++) {
          a2.push(deepsort(a[i]));
        }

        return a2;
      })(o);
    case Object.prototype:
      return (d => {
        const d2 = {};
        const keys = Object.keys(d).sort();

        for (let k = 0; k < keys.length; k++) {
          const key = keys[k];

          d2[key] = deepsort(d[key]);
        }

        return d2;
      })(o);
    default:
      return o;
  }
}

class DeepsortStream extends Transform {
  constructor(options) {
    super(options);
    this.options = options;
  }

  _transform(chunk, encoding, callback) {
    let result = JSON.stringify(JSON.parse(chunk.toString()), this.options.filter, null);
    result = JSON.stringify(deepsort(JSON.parse(result)), null, this.options.pretty);
    if (this.options.pretty) {
      result += "\n";
    }

    callback(null, result);
  }
}

module.exports = { DeepsortStream, deepsort };
