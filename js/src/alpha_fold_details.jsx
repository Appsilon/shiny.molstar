import Molstar from 'molstar-react';
import React from 'react';
import PropTypes from 'prop-types';
import { retrieve_metadata } from './utils';

class AlphaFoldDetails extends React.Component {

  state = {
    name: null,
    id : null,
    pbd: null,
    pae: null,
    cif: null,
    url: null,
    description: null,
    scientific_name: null,
    pae_img_url: null,
  }

  componentDidMount() {
    retrieve_metadata(this.props.afId, true, data => {
      if (!!data.entries && data.entries.length > 0) {
        const result = data.entries[0];
        let desc = result.fields.description[0];
        desc = desc.charAt(0).toUpperCase() + desc.slice(1);
        this.setState({
          id: result.id,
          url: `https://www.alphafold.ebi.ac.uk/entry/${this.props.afId}`,
          pdb: result.fields.pdb_url[0],
          cif: result.fields.cif_url[0],
          pae: result.fields.pae_doc_url[0],
          pae_img_url: result.fields.pae_image_url[0],
          description: desc,
          scientific_name: result.fields.scientific_name[0]
        });
      }
    })
  }

  render() {
    console.log(this.state, this.props.showFiles && (!!this.state.pdb || !!this.state.cif || !!this.state.pae));
    return <div className="alphafold-details">
      <h3>{!!this.state.description ? this.state.description : this.props.afId }</h3>
      {
        !!this.state.description && <div class="uniprot details">
          <span class="label-detail">Uniprot:&nbsp;</span>
          <span class="value">{this.props.afId}</span>
        </div>
      }
      {
        !!this.state.scientific_name && <div class="details">
          <span class="label-detail">Scientific Name:&nbsp;</span>
          <span class="value">{this.state.scientific_name}</span>
        </div>
      }
      {
        this.props.showPae && !!this.state.pae_img_url && <div class="pae_image details">
          <h4 class="label-detail">Predicted aligned error</h4>
          <img src={this.state.pae_img_url} />
        </div>
      }
      {
        !!this.state.url && <div class="details">
          <span class="label-detail">Source:&nbsp;</span>
          <span class="value">
            <a target="_blank" href={ this.state.url }>Alpha Fold db</a>
          </span>
        </div>
      }
      {
        this.props.showFiles && (!!this.state.pdb || !!this.state.cif || !!this.state.pae) && <>
            <h4>Download</h4>
            <ul>
              { !!this.state.pdb ? <li><a target="_blank" href={this.state.pdb} >PBD file</a></li> : null }
              { !!this.state.cif ? <li><a target="_blank" href={this.state.cif} >mmCIF file</a></li> : null }
              { !!this.state.pae ? <li><a target="_blank" href={this.state.pae} >Predicted aligned error</a></li> : null }
            </ul>
            <p>
              Please refer to the <a target="_blank" href="https://alphafold.com/faq#faq-7">AlphaFold FAQ</a>
              for more information on the files and formats
            </p>
          </>
      }
    </div>;
  }
};

AlphaFoldDetails.propTypes = {
  showFiles: PropTypes.bool,
  showPae: PropTypes.bool,
};

export default AlphaFoldDetails;
