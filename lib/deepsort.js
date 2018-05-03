function deepsort(o) {
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

module.exports = { deepsort };
