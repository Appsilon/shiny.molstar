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
      if (!!data.entries && data.entries.length > 0) {
        const result = data.entries[0];
        this.setState({
          id: result.id,
          pdb: result.fields.pdb_url[0],
        });
      }
    })
  }

  render() {
    return <>
      { !!this.state.error && <div class="error">{this.state.error}</div> }
      <Molstar url={this.state.pdb} {...this.props} />
    </>;
  }
};

AlphaFoldMolstar.propTypes = Molstar.propTypes;
AlphaFoldMolstar.propTypes.afId = PropTypes.string.isRequired;

export default AlphaFoldMolstar;
