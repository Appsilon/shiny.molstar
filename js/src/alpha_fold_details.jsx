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
    retrieve_metadata(this.props.uniProtId, true, data => {
      let desc = data.fields.description[0];
      desc = desc.charAt(0).toUpperCase() + desc.slice(1);
      this.setState({
        id: data.id,
        url: `https://www.alphafold.ebi.ac.uk/entry/${this.props.uniProtId}`,
        pdb: data.fields.pdb_url[0],
        cif: data.fields.cif_url[0],
        pae: data.fields.pae_doc_url[0],
        pae_img_url: data.fields.pae_image_url[0],
        description: desc,
        scientific_name: data.fields.scientific_name[0]
      });
    })
  }

  render() {

    const hasDesc = !!this.state.description;
    const hasPdb = !!this.state.pdb;
    const hasCif = !!this.state.cif;
    const hasPae = !!this.state.pae;

    return <div className="alphafold-details">
      <h3>{hasDesc ? this.state.description : this.props.uniProtId }</h3>
      {
        !!this.state.description && <div className="uniprot details">
          <span className="label-detail">Uniprot:&nbsp;</span>
          <span className="value">{this.props.uniProtId}</span>
        </div>
      }
      {
        !!this.state.scientific_name && <div className="details">
          <span className="label-detail">Scientific Name:&nbsp;</span>
          <span className="value">{this.state.scientific_name}</span>
        </div>
      }
      {
        this.props.showPae && !!this.state.pae_img_url && <div className="pae_image details">
          <h4 className="label-detail">Predicted aligned error</h4>
          <img src={this.state.pae_img_url} />
        </div>
      }
      {
        !!this.state.url && <div className="details">
          <span className="label-detail">Source:&nbsp;</span>
          <span className="value">
            <a target="_blank" rel="noreferrer" href={ this.state.url }>Alpha Fold db</a>
          </span>
        </div>
      }
      {
        this.props.showFiles && (hasPdb || hasCif || hasPae) && <>
            <h4>Download</h4>
            <ul>
              { hasPdb ? <li><a target="_blank" rel="noreferrer" href={this.state.pdb} >PBD file</a></li> : null }
              { hasCif ? <li><a target="_blank" rel="noreferrer" href={this.state.cif} >mmCIF file</a></li> : null }
              { hasPae ? <li><a target="_blank" rel="noreferrer" href={this.state.pae} >Predicted aligned error</a></li> : null }
            </ul>
            <p>
              <span>Please refer to the </span>
              <a target="_blank" rel="noreferrer" href="https://alphafold.com/faq#faq-7">AlphaFold FAQ</a>
              <span> for more information on the files and formats</span>
            </p>
          </>
      }
    </div>;
  }
}

AlphaFoldDetails.propTypes = {
  uniProtId: PropTypes.string.isRequired,
  showFiles: PropTypes.bool,
  showPae: PropTypes.bool,
};

export default AlphaFoldDetails;
