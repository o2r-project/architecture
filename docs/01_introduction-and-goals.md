## 1. Introduction and Goals

### 1.1 Requirements Overview

The system must provide a reliable way to create and examine (e.g. discover, inspect) reproducibility packages of computational research to support reproducible publications.
This architecture describes the relationship of the reproducibility service with other services from the context of scientific collaboration and publishing and how they can be combined to a new system for scholarly publications.

At its core is the concept of the **Executable Research Compendium** (ERC, see [specification](http://o2r.info/erc-spec) and [article](https://doi.org/10.1045/january2017-nuest)), and a supporting reproducibility service, which is defined by a [web **API** specification](http://o2r.info/o2r-web-api/) and its [**reference implementation**](https://github.com/o2r-project/reference-implementation) is published as open source software.

### 1.2 Quality Goals

Transparency
: The system must be transparent to allow scrutiny required by a rigorous scientific process.

Separation of concern
: The system must integrate with existing services and focus on the core functionality.
It must not replicate existing functionality such as storage or persistent identification.

Flexibility & modularity
: In regard to the research project setting, the system components must be well separated, so that functions can be developed independently, e.g. using different programming languages.
This allows different developers to contribute efficiently.

### 1.3 Stakeholders

Role/Name | Goal/point of contact | Required interaction
--------- | ------- | ------------
Author (scientist) | publish ERC as part of a scientific publication process | -
Reviewer (scientist) | examine ERC during a review process | -
Co-author (scientist) | contribute to ERC during research (e.g. cloud based) | -
Reader (scientist) | view and interact with ERC on a journal website | -
Publisher | increase quality of publications in journals with ERC | -
Curator/preservationist | ensure research is complete and archivable using ERC | -
Operator | provide infrastructure to researchers at my university to collaborate and conduct high-quality research using ERC | -
Developer | use and extend the tools around ERC | -

Some of the stakeholders are accompanied by [user scenarios](user-scenarios.md) in prose.
