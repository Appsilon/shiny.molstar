import "core-js/stable";
import "regenerator-runtime/runtime";
import Molstar from 'molstar-react';
import AlphaFoldMolstar from './alpha_fold_molstar';
import AlphaFoldDetails from './alpha_fold_details';

window.jsmodule = {
  ...window.jsmodule,
  'molstar-react': { Molstar },
  '@/shiny.molstar': { AlphaFoldMolstar, AlphaFoldDetails }
};
