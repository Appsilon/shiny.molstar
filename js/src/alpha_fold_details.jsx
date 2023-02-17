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

    const hasDesc = !!this.state.description;
    const hasPdb = !!this.state.pdb;
    const hasCif = !!this.state.pdb;
    const hasPae = !!this.state.pdb;

    return <div className="alphafold-details">
      <h3>{hasDesc ? this.state.description : this.props.afId }</h3>
      {
        !!this.state.description && <div className="uniprot details">
          <span className="label-detail">Uniprot:&nbsp;</span>
          <span className="value">{this.props.afId}</span>
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
        this.props.showFiles && (!!this.state.pdb || !!this.state.cif || !!this.state.pae) && <>
            <h4>Download</h4>
            <ul>
              { hasPdb ? <li><a target="_blank" rel="noreferrer" href={this.state.pdb} >PBD file</a></li> : null }
              { hasCif ? <li><a target="_blank" rel="noreferrer" href={this.state.cif} >mmCIF file</a></li> : null }
              { hasPae ? <li><a target="_blank" rel="noreferrer" href={this.state.pae} >Predicted aligned error</a></li> : null }
            </ul>
            <p>
              Please refer to the <a target="_blank" rel="noreferrer" href="https://alphafold.com/faq#faq-7">AlphaFold FAQ</a>
              for more information on the files and formats
            </p>
          </>
      }
    </div>;
  }
}

AlphaFoldDetails.propTypes = {
  afId: PropTypes.string.isRequired,
  showFiles: PropTypes.bool,
  showPae: PropTypes.bool,
};

export default AlphaFoldDetails;
