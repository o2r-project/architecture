## Introduction and Goals

### Requirements Overview

The system must provide a reliable way to create, execute, and manipulate reproducibility packages of computational resesearch.
It is based on the **Executable Research Compendium (ERC) [specification](http://o2r.info/erc-spec)**.

### Quality Goals

Transparency
: The system must be transparent to allow scrutiny required by a rigorous scientific process.

Separation of concern
: The system must integrate with existing platforms and focus on the core functionality. It must not replicate existing functionality such as storage or persistent identification.

Flexibility & modularity
: In regard to the research project setting, the system components must be well seperated, so that functions can be developed independently, e.g. using different programming languages. This allows different developers to contribute effeciently.

### Stakeholders

Role/Name | Goal/point of contact | Required interaction
--------- | ------- | ------------
Author (scientist) | publish ERC as part of a scientific publication process | -
Reviewer (scientist) | inspect ERC during a review process from a review platform | -
Co-author (scientist) | contribute to ERC during research (e.g. cloud based) | -
Reader (scientist) | view and interact with ERC on a journal website | -
Publisher | increase quality of publications in journals with ERC | -
Curator/preservationist | ensure research is complete and archivable using ERC | -
Operator | provide infrastructure to researchers at my university to collaborate and conduct high-quality research using ERC | -
Developer | use and extend the tools around ERC | -

Some of the stakeholders are accompanied by [user scenarios](user-scenarios.md) in prose.
