# Metadata in o2r

This document describes the internal processes handling metadata for ERC.
For information on the metadata model for ERC as part of the o2r web API please see [the API specification](http://o2r.info/o2r-web-api/compendium/#metadata).

The remainder of this document describes _who_ handles metadata _when_ and _how_ within the [o2r architecture](https://github.com/o2r-project/architecture/blob/master/README.md).

## Files vs. database and time of execution

In all workflows, files are created within ERC in a specific subdirectory `.erc` holding different kinds, formats, or versions of metadata.
For ease of access via web API, the information is also stored within the database.

**The files in the compendium are always the normative source of information.**

Mtadata workflows are **conducted on-demand**, i.e. when first needed.
The brokering output is then stored in respective files and the database.

## Metadata extraction and brokering during creation of ERC

**muncher** as the main [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) component for ERC controls the upload workflow.
The creation from the metadata perspective is as follows:

1. `init` stores the files for a new ERC in a directory.
1. `extract` uses `metaextract.py` ([docs](https://github.com/o2r-project/o2r-meta#2-metaextract)) to analyse the incoming ERC and creates new files with _raw_ metadata for each of the scanned files.
This metadata is _schemaless_ and non-semantic.
  - output file: `.erc/metadata_raw_<file-identifier>.json`
  - database field: `<compendium>.metadata.raw`
1. `broker` uses `metabroker.py` ([docs](https://github.com/o2r-project/o2r-meta#5-metabroker)) to translate the _raw_ metadata in `json` to _o2r_ metadata in `json`.
  - output file: `.erc/metadata_o2r.json`
  - database field: `<compendium>.metadata.o2r`
1. (`harvest` TBD; will use third party resources to enrich metadata)
1. `save` stores the new ERC to the database including the aforementioned metadata fields.
1. `user check` provides an interactive form to the uploading user to control and edit the suggested metadata.
Suggestions may be based on both _o2r_ and _raw_ metadata. The check workflow is handled in the web client project.
1. `update` updates the metadata in both database and file with the user's edits.
This step creates _valid o2r_ metadata.

It is currently _not_ expected that extraction or brokering can be re-run on user actions.

## Metadata brokering during shipments

**shipper** as the controller of shipments controls the shipment workflow.
A shipment from the metadata perspective is as follows:

1. `init` creates a new shipment object in memory for a user-defined destination.
1. `broker` uses `metabroker.py` to translate _valid o2r_ metadata to the format and model required by the shipment destination.
The map file for brokering is determined by the shipper.
The supported shipment types and destinations are shown in the table below.
  - output file: `.erc/<destication>.<format>`, e.g. `zenodo.json` or `datacite.xml`
  - database field: `<compendium>.metadata.<destination>`
  In case the destination uses `xml`, an escaped string representation of the file (without preserving line breaks) is stored in the field `<compendium>.metadata.<destination>.xml`.
1. `save` stores the shipment metadata to the database.
1. `user check` provides an interactive form to the user to control the metadata translation.
**Reasoning**: It is very likely that not all information can be brokered automatically, because of inconsistencies between metadata models and because the required user input during creation is kept to a minimum.
Therefore the fields required by shipping destinations are not mandatory in the o2r metadata model.
1. `send & update` starts the actual shipment using the metadata file and updates the metadata in both database and file with the user's edits.

**destination** | **model** | **format(s)** | **description**
------ | ------ | ------ | ------
`zenodo` | [Deposition metadata](https://zenodo.org/dev#collapse-list16) | `json` | for storing full ERC in the Zenodo data repository
`datacite` | [DataCite Metadata Schema 4.0](http://schema.datacite.org/meta/kernel-4.0/) | `xml` | for metadata export
`ORCID` (TBD) | [XML for orcid-works](https://members.orcid.org/api/xml-orcid-works) | `xml` | for adding ERC as works to an ORCID profile
`CRIS` (TBD) | ... | `xml` | ...
`codemeta` (TBD) | ... | `json` | ...
