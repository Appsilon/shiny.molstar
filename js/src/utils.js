
// Helper function to retrieve metadata for AlphaFold id
//
// The id is the uniprot id for the protein and is retrieved
// via from EMBL-EBI
//
// Information about AlphaFold pavailable metadata at:
//   https://www.ebi.ac.uk/ebisearch/metadata.ebi?db=alphafold
export function retrieve_metadata(afId, fullQuery, callback) {
  const baseUrl = "https://www.ebi.ac.uk/ebisearch/ws/rest/alphafold" +
    `/entry/${afId}`;

  let params = {
    format: "json",
    fields: ["pdb_url"],
  };

  if (fullQuery) {
    params.fields = params.fields.concat([
      "name", "description", "scientific_name", "gene", "cif_url",
      "pae_doc_url", "pae_image_url"
    ]);
  }
  params.fields = params.fields.join(",");

  const url = baseUrl + `?format=${params.format}&fields=${params.fields}`;

  fetch(url)
    .then(response => response.json())
    .then(data => {
      if (!!data.entries && data.entries.length > 0) {
        const result = data.entries[0];
        callback(result)
      }
    });
}
