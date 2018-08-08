## 2. Architecture constraints

This section shows constraints on this project given by involved parties or conscious decisions made to ensure the longevity and transparency of the architecture and its implementations.
If applicable, a motivation for constraints is given. (based on [biking2](https://biking.michael-simons.eu/docs/index.html#section-architecture-constraints))

### 2.1 Technical constraints

&nbsp; | Constraint | Background and/or motivation
------ | ---------- | ----------------------------
TECH.1 | Only open licenses | All third party software or used data must be available under a suitable code license, i.e. either [OSI-approved](https://opensource.org/licenses) or [ODC license](https://opendatacommons.org/licenses).
TECH.2 | OS independent development and deployment | Server applications must run in well defined [Docker](https://docker.com) containers to allow installation on any host system and to not limit developers to a specific language or environment.
TECH.3 | Do not store secure information | The team members experience and available resources do not allow for handling information with security concerns, so no critical data, such as user passwords but also data with privacy concerns, must be stored in the system.
TECH.4 | Configurations for ERC runtimes | ERCs include the runtime environment in form of a binary archive. The architecture must support executing this runtime environment and must be able to provide different configurations outside it, for example [computer architectures](/glossary#computer-architecture) or operating system [kernels](/glossary#kernel). The minimum requirements for the containerisation solution regarding architecture and kernel apply.

### 2.2 Organizational constraints

&nbsp; | Constraint | Background and/or motivation
------ | ---------- | ----------------------------
ORG.1 | Team and schedule | [https://o2r.info/about](https://o2r.info/about)
ORG.2 | Do not interfere with existing well-established peer-review process | This software is _not_ going to change how scientific publishing works, nor should it. While intentioned to support public peer-reviews, open science etc., the software should be agnostic of these aspects.
ORG.3 | Only open licenses | All created software must be available under an [OSI-approved](https://opensource.org/licenses) license, documentation and specification under a [CC license](https://creativecommons.org/licenses).
ORG.4 | Version control/management | Code must be versioned using `git` and published on [GitHub](https://github.com/o2r-project).
ORG.5 | Acknowledge transfer from group domain to persistent domain | The ERC bundles artifacts coming from a private or group domain for a transfer to a public and persistent domain (cf. [Curation Domain Model](http://www.forschungsdaten.org/index.php/Curation_Domain_Model) (in German)), which imposes requirements on the incorporated metadata.

### 2.3 Conventions

&nbsp; | Constraint | Background and/or motivation
------ | ---------- | ----------------------------
CONV.1 | Provide formal architecture documentation | Based on [arc42](http://arc42.org/) (template version 7.0).
CONV.2 | Follow coding conventions | Typical project layout and coding conventions of the respective used language should be followed as far as possible. However, we explicitly accept the research project context and do _not_ provide full tests suites or documentation beyond what is needed by project team members.
CONV.3 | Documentation language is British English | International research project must be understandable by anyone interested; consistency increases readability.
CONV.4 | Use subjectivisation for server component names | Server-side components are named using personalized verbs or (ideally) professions: _muncher_, _loader_, _transporter_. All git repositories for software use an `o2r-` prefix, in case of server-side components e.g. `o2r-shipper`.
CONV.5 | Configuration using environment variables | Server-side components must be configurable using all caps environment variables prefixed with the component name, e.g. `SHIPPER_THE_SETTING`, for required settings. Other settings should be put in a settings file suitable for the used language, e.g. `config.js` or `config.yml`.
