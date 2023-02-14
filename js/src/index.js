require("core-js/stable");
require("regenerator-runtime/runtime");
const Molstar = require('molstar-react');

window.jsmodule = {
  ...window.jsmodule,
  'molstar-react': Molstar,
};
