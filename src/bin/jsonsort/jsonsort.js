#!/usr/bin/node

const os   = require("os");
const path = require("path");

const { DeepsortStream } = require(path.resolve(os.homedir(), "lib/deepsort.js"));

let args = [];
let opts = {
  filter: null,
  pretty: null,
};

for (let i = 1; i < process.argv.length; i++) {
  switch (process.argv[i]) {
    case "-f":
    case "--filter":
      opts.filter = process.argv[++i].split(",");
      break;
    case "-p":
    case "--pretty":
      opts.pretty = 2;
      break;
    default:
      args.push(process.argv[i]);
      break;
  }
}

const deepsorter = new DeepsortStream(opts);

deepsorter.pipe(process.stdout);
process.stdin.pipe(deepsorter);
