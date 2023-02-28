import Molstar from 'molstar-react';
import React from 'react';
import PropTypes from 'prop-types';

import { retrieve_metadata } from './utils';

class AlphaFoldMolstar extends React.Component {

  state = {
    id : null,
    pbd: null,
    error: null,
  }

  componentDidMount() {
    retrieve_metadata(this.props.uniProtId, false, data => {
      this.setState({
        id: data.id,
        pdb: data.fields.pdb_url[0],
        cif: data.fields.cif_url[0],
      });
    })
  }

  render() {
    const url = this.props.useCif ? this.state.cif : this.state.pdb;
    return <>
      { !!this.state.error && <div className="error">{this.state.error}</div> }
      <Molstar url={url} {...this.props} />
    </>;
  }
}

AlphaFoldMolstar.propTypes = Molstar.propTypes;
AlphaFoldMolstar.propTypes.uniProtId = PropTypes.string.isRequired;
AlphaFoldMolstar.propTypes.useCif = PropTypes.bool;

export default AlphaFoldMolstar;
