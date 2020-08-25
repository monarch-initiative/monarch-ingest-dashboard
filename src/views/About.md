### Knowledge Graph Hub concept

A Knowledge Graph Hub (KG Hub) is software to download and transform data to a central location for building knowledge graphs (KGs) from different combination of data sources, in an automated, `YAML`-driven way. The workflow is:
- download data
- transform data for each data source into two TSV files (`edges.tsv` and `nodes.tsv`) as specified [here](https://github.com/NCATS-Tangerine/kgx/blob/master/data-preparation.md)
- merge the graphs for each data source of interest using [KGX](https://github.com/NCATS-Tangerine/kgx/) to produce a merged knowledge graph

To facilitate interoperability of datasets, [biolink](https://biolink.github.io/biolink-model/) [categories](https://biolink.github.io/biolink-model/docs/category.html) are added to nodes and [biolink](https://biolink.github.io/biolink-model/) [associations](https://biolink.github.io/biolink-model/docs/Association) are added to edges during transformation. 

### KG-COVID-19 project

The [KG-Covid-19](https://github.com/Knowledge-Graph-Hub/kg-covid-19/) project is the first such KG Hub. Output is a Knowledge Graph Hub that downloads and transforms COVID-19/SARS-COV-2 and related data and emits a knowledge graph that can be loaded into KGX and used for machine learning or others uses, to produce actionable knowledge. 

**Downloading the knowledge graph:**

A merged knowledge graph comprised of data from all available transforms is here:

[RDF](http://kg-hub.berkeleybop.io/kg-covid-19.nt.gz)

[TSV](http://kg-hub.berkeleybop.io/kg-covid-19.tar.gz)

See [here](https://github.com/NCATS-Tangerine/kgx/blob/master/data-preparation.md) for a description of the KGX TSV format.

**Summary of data:**

A detailed, up-to-date summary of data in kg-covid-19 is [here](http://kg-hub.berkeleybop.io/merged_graph_stats.yaml), with contents of the knowledge graph broken down by biolink categories and biolink associations for nodes and edges, respectively.

![A schematic summary of data ingested (as of Apr 2020) is here:](/summary.png)

As of July 6, 2020, the graph contains the following data:

    count_by_category:
      biolink:OntologyClass: 80005
      biolink:Publication: 52105
      biolink:Drug: 32204
      biolink:BiologicalProcess: 30702
      biolink:ChemicalSubstance: 29858
      biolink:Protein: 21070
      biolink:Gene: 19240
      biolink:MolecularActivity: 12202
      human_phenotype: 10384
      biolink:AnatomicalEntity: 4656
      biolink:CellularComponent: 4454
      unknown: 4340
      biolink:Disease: 289
      biolink:NamedThing: 227
      external: 87
      biolink:Assay: 48
      sequence: 46
      biolink:RNA: 7
      biolink:OrganismalEntity: 6
      biolink:MolecularEntity: 1
      gene_ontology: 1

We gratefully acknowledge the [Elsevier Coronavirus Information Center](https://www.elsevier.com/connect/coronavirus-information-center) for sharing their coronavirus pathway data, and also acknowledge and thank all COVID-19 data providers for making their data available. 

**A few organizing principles:**
- UniprotKB IDs are used for genes and proteins when possible
- For drug/compound IDs, these IDs are preferred, in descending order of preference: CHEBI > CHEMBL > DRUGBANK > PUBCHEM
- Less is more: for each data source, we ingest only the subset of data that is most relevant to the KG-Hub in question (here KG-COVID-19)
- We avoid ingesting data from a source that isn't authoritative for the data in question (e.g. do not ingest protein interaction data from a drug database)
- Each ingest should make an effort to add provenance data by adding a `provided_by` column in each edge TSV file, populated with the source of each datum

**People:**
* [Justin Reese](https://github.com/justaddcoffee)
* [Deepak Unni](https://github.com/deepakunni3)
* [Marcin Joachimiak](https://github.com/realmarcin)
* [Peter Robinson](https://github.com/pnrobinson)
* [Chris Mungall](https://github.com/cmungall)
* [Tiffany Callahan](https://github.com/callahantiff)
* [Luca Cappelletti](https://github.com/LucaCappelletti94)
* [Vida Ravanmehr](https://github.com/vidarmehr)

**The code:**
- [Here](https://github.com/Knowledge-Graph-Hub/kg-covid-19) is the github repo for this project.

- [Here](https://github.com/monarch-initiative/embiggen) is the github repo for Embiggen, an implementation of node2vec and other methods to generate embeddings and apply machine learning to graphs.

**Installation:**

    git clone https://github.com/Knowledge-Graph-Hub/kg-covid-19
    cd kg-covid-19
    pip install .
    pip install -r requirements.txt

**Running the code:**

    python run.py download
    python run.py transform
    python run.py merge

**Querying the graph:**

A SPARQL endpoint for the complete, merged graph with all available source data is [here](http://kg-hub-rdf.berkeleybop.io/blazegraph/#query). Consider using https://yasgui.triply.cc/ for querying. Here are
some example queries: 
https://github.com/Knowledge-Graph-Hub/kg-covid-19/tree/master/queries/sparql


**Contributing:**
- [Here](https://github.com/Knowledge-Graph-Hub/kg-covid-19/wiki/How-to-help) is a more detailed description, and instructions on how to help.


<style scoped>
  .vmark {
    margin: 2em 5em 2em 5em;
    text-align: left;
  }
</style>
