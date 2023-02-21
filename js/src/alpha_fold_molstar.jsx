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
    retrieve_metadata(this.props.afId, false, data => {
      this.setState({
        id: data.id,
        pdb: data.fields.pdb_url[0],
      });
    })
  }

  render() {
    return <>
      { !!this.state.error && <div className="error">{this.state.error}</div> }
      <Molstar url={this.state.pdb} {...this.props} />
    </>;
  }
}

AlphaFoldMolstar.propTypes = Molstar.propTypes;
AlphaFoldMolstar.propTypes.afId = PropTypes.string.isRequired;

export default AlphaFoldMolstar;
