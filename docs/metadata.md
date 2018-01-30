# Metadata workflows

This document describes the internal processes handling metadata for ERC.
For information on the metadata model for ERC as part of the o2r web API please see [the API specification](http://o2r.info/o2r-web-api/compendium/metadata).

The remainder of this document describes _who_ handles metadata _when_ and _how_ within the [o2r architecture](/).

## Files vs. database

In all workflows files are created within ERC in a specific subdirectory `.erc` holding different kinds, formats, or versions of metadata.
For ease of access via web API, the information is also stored within the database.

**The files in the compendium are always the normative source of information.**

The term _brokering_ means the translation from schema-less to schema-specific metadata, as well as inter-schema mappings.
The brokering output is then stored in respective files and mirrored to the database by the reproducibility service.

## Metadata extraction and brokering during creation

`muncher` is the main [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) component for compedia.
It controls the creation workflow.

The creation from the metadata perspective is as follows:

1. `init` stores the files for a new ERC in a directory.
1. `extract` uses `metaextract.py` ([docs](https://github.com/o2r-project/o2r-meta#2-metaextract)) to analyse the incoming ERC and creates new files with _raw_ metadata for each of the scanned files. Currently the following types of files will be considered: _.r, .rmd, .shp, "bagit.txt"_. Future releases of the extractor will be likely to consider _.tex, .json (geojson), .jp2, .tiff_ and more.
This raw metadata itself is _schema-less_ and non-semantic.
The processed files are in conceptual competition for the best representative of the working directory's meta information, i.e. there will be only one main output, ideally represented by the most complete set of metadata.
By default the competing bits of information will also be preserved in `.erc/metadata_raw_<filename>.json` where _filename_ is an identifier based on the original source file.
  - output file: `.erc/metadata_raw.json`
  - database field: `<compendium>.metadata.raw`
1. `broker` uses `metabroker.py` ([docs](https://github.com/o2r-project/o2r-meta#5-metabroker)) to translate the _raw_ metadata in `json` to _o2r_ metadata in `json` as being compliant to the o2r json-schema.
  - output file: `.erc/metadata_o2r.json`
  - database field: `<compendium>.metadata.o2r`
1. (`harvest` TBD; will connect to third party database endpoint via OAI-PMH to gather additional information for the enrichment of the o2r metadata collected via extraction)
1. `save` stores the new ERC to the database including the aforementioned metadata fields.
1. `user check` provides an interactive form to the uploading user to control and edit the suggested metadata.
Suggestions are based on _o2r_ metadata.
The check workflow is handled in the web client project.
1. `update` updates the metadata in both database and file with the user's edits.
This step creates _valid o2r_ metadata.
The metadata update includes _all brokering_ to the configured metadata formats, meaning the brokered metadata is always up-to-date and based on the same source, the _o2r_ metadata.

By design there is no metadata brokering during shipments or job executions.
Because it is likely that not all information can be brokered automatically, the metadata required by shipping destinations are mandatory in the o2r metadata model to reduce the user involvement to a minimum, i.e. when updating the metadata.
In the same vein, all _validation_ takes place during metadata updates, because that is the only time a user can react to validation errors.

## Metadata for shipments

The `shipper` uses the metadata stored in the ERC directory `.erc` to start a shipment of data or metadata to third-party repositories.
It does not do any updating, brokering, or validation.

## Metadata mappings

**destination** | **model** | **format(s)** | **description**
------ | ------ | ------ | ------
`zenodo` | [Deposition metadata](https://zenodo.org/dev#collapse-list16) | `json` | for storing full ERC in the Zenodo data repository; Zenodo also publishes metadata on [DataCite](https://datacite.org/)
[//]: # (`datacite` | [DataCite Metadata Schema 4.0](http://schema.datacite.org/meta/kernel-4.0/) | `xml` | for metadata export)
[//]: # (`datacite` | [DataCite Metadata Schema 3.1](http://schema.datacite.org/meta/kernel-3.1/) | `xml` | (still in wide spread use for OAI-PMH))
[//]: # (`ORCID` (TBD) | [XML for orcid-works](https://members.orcid.org/api/xml-orcid-works) | `xml` | for adding ERC as works to an ORCID profile)
[//]: # (`CRIS` (TBD) | (local adaptation of the [CERIF model](http://www.eurocris.org/cerif/main-features-cerif) | `xml` | ...)
[//]: # (`codemeta` (TBD) | [codemeta 1.0](https://github.com/codemeta/codemeta/releases/tag/1.0) | `json` | ...)
