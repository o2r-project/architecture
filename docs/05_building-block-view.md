## 5. Building block view

### 5.1 Refinement Level 1

#### 5.1.1 Blackbox Publication Platforms

Publications platforms are the online interaction points of users with scientific works.
Users create publications, e.g. submitting to a scientific journal, publishing on a pre-print server, publishing on a self-hosted website, or collaborating in online repositories.
Users examine publications, e.g. browsing, searching, reading, downloading, or reviewing.

#### 5.1.2 Blackbox ID Provider

Identification information of distributed systems is crucial, and for security reasons as well as for limiting manual reproduction of metadata, a central service can provide all of

- unique _identification of users_ and _metadata on users_,
- _authentication_ of users, and
- metadata on a user's _works_, e.g. publications or ERC.

Persistent identifiers for artifacts in the reproducibility service itself are _not required_, as these are provided by data storage and registries.
However, services such as [ePIC](http://www.pidconsortium.eu/) could allow to retrieve persistent IDs.

#### 5.1.3 Blackbox Execution Infrastructure

The execution infrastructure provides CPU time and temporary result storage space for execution of ERC, both "as is" and with manipulation, i.e. changed parameters.

#### 5.1.4 Blackbox Data Repositories

Data repositories are all services storing data but not software.
More specifically, they may store software "as data", but not with software-specific features such as code versioning or installation binaries for different computer architectures.
Data repositories may be self-hosted or public/free, domain-specific or generic.
They typically provide persistent identifiers or handles, e.g. a [DOI](https://www.doi.org/) or [URN](https://en.wikipedia.org/wiki/Uniform_Resource_Name).
They are used both for loading created ERC and for storing the ERC created by the reproducibility service.

#### 5.1.5 Blackbox Registries

Registries are metadata indexes or catalogues.

They are recipients of metadata exports by the reproducibility service to share information about ERC, e.g. add a new ERC to an author's profile.
This requires the reproducibility services to translate the internal metadata model into the recipients data model and encoding. 

They are sources of metadata during ERC creation when the information in the fetched content is used to query registries for additional information which can be offered to the user.

#### 5.1.6 Blackbox Software Repositories

Software repositories are a source and a sink for software at different abstraction levels.
They are a source for software dependencies, such as system packages for installing a library.
They are a sink for executable images, which comprise a number of software artifacts and their dependencies, for a specific ERC instance.

### 5.2 Refinement Level 2

#### 5.2.1 Whitebox Publication Platforms

Publication platforms can be roughly divided into two groups.
They can be either specific journals hosted independently, such as [JStatSoft](http://www.jstatsoft.org/) or [JOSS](http://joss.theoj.org/), or a larger platform provided by a publisher to multiple journals, such as [ScienceDirect](http://sciencedirect.com/), [MDPI](http://www.mdpi.com/), [SpringerLink](https://link.springer.com/), or [PLOS](https://plos.org/).
To some extend, pre-print servers, for example [OSF](https://osf.io/) or [arXiv.org](https://arxiv.org/), can also fall into the latter category.

Integration with the reproducibility service can happen via plug-ins to generic software, e.g. [OJS](https://pkp.sfu.ca/ojs/), or by bespoke extensions.
Integrations are based on the service's public API.

#### 5.2.2 Whitebox ID Provider

The reproducibility service uses [ORCID](http://orcid.org/) to authenticate users and retrieve user metadata.
The reproducibility service does not use the ORCID authorisation to edit ORCID user data or retrieve non-public data from ORCID, thus this process is [pseudo-authentication using OAuth](https://security.stackexchange.com/questions/44611/difference-between-oauth-openid-and-openid-connect-in-very-simple-term).
Internally, the user's public `ORCID` is the main identifier.
User have different levels, which allow different actions, such as "registered user" or "administrator".
These levels are stored in the reproducibility service.

#### 5.2.3 Whitebox Execution Infrastructure

Such an infrastructure could be either self-hosted, e.g. [Docker Swarm](https://www.docker.com/products/docker-swarm)-based, or use a cloud service provide, such as [Amazon EC2](https://aws.amazon.com/ec2/), [Docker Cloud](http://cloud.docker.com/), or even use continuous integration services such as [Travis CI](https://travis-ci.org/) or [Gitlab CI](https://about.gitlab.com/gitlab-ci/).

#### 5.2.4 Whitebox Data Repositories

[![whitebox data repositories](img/5.2-whitebox-data-repos.png)](img/5.2-whitebox-data-repos.png)

The reproducibility service _does not persistently store anything_.
It only keeps copies of files during creation and inspection.
So where are ERCs saved and where is their data coming from?

**Collaboration platforms**, e.g. [ownCloud/Sciebo](http://sciebo.de/), [GitHub](http://github.com/), [ShareLatex](http://sharelatex.com/), [OSF](https://osf.io/), allow users to create, store, and share their research (code, text, data, et cetera).
Besides being an interaction platform for users, they can also be seen simply as a data repository.
The reproducibility service fetches contents for building an ERC from them based on public links, e.g. a public GitHub repository or shared Sciebo folder.
It is possible to link ERC creation to an project/repository under development on a collaboration platform as to trigger an ERC (re-)creation or execution when changes are made.

Protocols: `WebDAV`, `ownCloud`, `HTTP` (including [webhooks](https://en.wikipedia.org/wiki/Webhook)), `git`

**Domain data repositories**, e.g. [PANGAEA](https://www.pangaea.de/) or [GFZ Data Services](http://dataservices.gfz-potsdam.de/portal/), can be accessed by the reproducibility service during creation and execution of ERC to download data.
Allowing access to data repositories reduces data duplication but requires control over/trust in the respective repository.

Protocol: `HTTP` APIs

Generic **Repositories**, e.g. [Zenodo](https://zenodo.org/), [Mendeley Data](https://data.mendeley.com/), [Figshare](http://figshare.com/), [OSF](https://osf.io/), provide (a) access to complete ERC stored in repositories for inspection and execution by the reproducibility service, and (b) storage of created ERC. repositories.

Protocols: (authenticated) `HTTP` APIs

**Archives** and digital preservation solutions can provide long-term preservation of ERC.
Preservation either lies in the responsibility of the repository, which might save the hosted content to an archive or an archive harvests a repository, or is a task for one of the involved platform providers, e.g. using an installation of [Archivematica](https://www.archivematica.org/).

Protocol: `HTTP` carrying bitstreams and metadata

!!! Note "_Data Curation Continuum_"
    The Data Curation Continuum (cf. [diagram by Andre Treloar](http://andrew.treloar.net/research/diagrams/data_curation_continuum.pdf)), describes how data moves from the private domain of a researcher to the public domain of data repositories over the course of conducting research. It describes the properties of data and important aspects of the transitions. In a publishing process based on the reproducibility service, the full migration process is run through. 

#### 5.2.5 Whitebox Registries

Research data registries and websites, for example ([CRIS](https://www.uni-muenster.de/FB7_MultimediaSupport/CRIS_Infoseite/Forschungsdatenbank_Infoseite.html), [DataCite](https://www.datacite.org/), [Google Scholar](https://scholar.google.de/), [Scopus](https://www.scopus.com/), [Altmetric](https://www.altmetric.com/), to name just a few, collect metadata on publications and provide services with this data.
Services comprise discovery but also derivation of citation data and creating networks of researchers and publications.

The listed examples include open platforms, commercial solutions, and institution-specific platforms.
Some of the registries offer a public, well-defined API to retrieve structured metadata and to create new records.

Protocol: `HTTP` APIs

#### 5.2.6 Whitebox Software Repositories

[![whitebox software repositories](img/5.2-whitebox-software-repos.png)](img/5.2-whitebox-software-repos.png)

##### 5.2.6.1 Blackbox Package repositories

Package repositories are used during ERC creation to download and install software artifacts for specific operating systems, e.g. [Debian APT](https://wiki.debian.org/Apt) or [Ubuntu Launchpad](https://launchpad.net/ubuntu), for specific programming languages or environments, e.g. [CRAN](https://cran.r-project.org/), or from source, e.g. [GitHub](https://github.com/).

##### 5.2.6.2 Blackbox Container registries

Container registries such as [Docker Hub](https://hub.docker.com/), [Quay](https://quay.io/), self-hosted [Docker Registry 2.0](https://github.com/docker/distribution) or [Amazon ERC](https://aws.amazon.com/de/ecr/), store executable images of runtime environments.
They can be used to distribute the runtime environments across the execution infrastructure and provide an intermediate ephemeral storage for the reproducibility service.

#### 5.2.7 Whitebox Reproducibility Service

[![whitebox reproducibility service](img/5.2-whitebox-repro-service.png)](img/5.2-whitebox-repro-service.png)

##### 5.2.7.1 Blackbox Webserver

A webserver handles all incoming calls to the API (`/api/v1/`) via `HTTPS` (`HTTP` is redirected) and distributes them to the respective microservice.
A working [nginx](https://nginx.org) configuration is available [in the test setup](https://github.com/o2r-project/o2r-platform/blob/master/dev/nginx.conf).

##### 5.2.7.2 Blackbox UI

The UI is a web application based on [Angular JS](https://angularjs.org/), see [o2r-platform](https://github.com/o2r-project/o2r-platform).
It connects to all microservices via their API and is served using the same webserver as the API.

##### 5.2.7.3 Blackbox Microservices

The reproducibility service uses a [microservice architecture](https://en.wikipedia.org/wiki/Microservices) to separate functionality defined by the **[web API specification](http://o2r.info/o2r-web-api)** into manageable units.

This allows scalability (selected microservices can be deployed as much as needed) and technology independence for each use case and developer.
The microservices all access one main database and a shared file storage.

##### 5.2.7.4 Blackbox Tools

Some functionality is developed as standalone tools and used as such in the microservices instead of re-implementing features.
These tools are integrated via their command line interface (CLI) and executed as _2nd level containers_ by microservices.

##### 5.2.7.5 Blackbox Databases

The _main document database_ is the unifying element of the microservice architecture.
All information shared between microservices or transactions between microservices are made via the database, including session state handling for authentication.

A _search database_ is used for full-text search and advanced queries.

The database's operation log, normally used for synchronization between database nodes, is also used for 

- event-driven communication between microservices, and
- synchronization between main document database and search index.

!!! Note
    This eventing "hack" is expected to be replaced by a proper eventing layer for productive deployments.

##### 5.2.7.6 Blackbox Ephemeral file storage

After loading from external sources and during creation of ERC, the files are stored in a file storage shared between the microservices.
The file structure is known to each microservice and read/write operations happen as needed.

### 5.3 Refinement Level 3

#### 5.3.1 Whitebox microservices

Each microservice is encapsulated as a [Docker](http://docker.com/) container running at its own port on an internal network and only serving its respective API path.
Internal communication between the webserver and the microservices is unencrypted, i.e. `HTTP`.

**Testing**: the [reference implementation](https://github.com/o2r-project/reference-implementation) provides instructions on running a local instance ofr the microservices and the demonstration UI.

**Development**: the [o2r-platform](https://github.com/o2r-project/o2r-platform) GitHub project contains [docker-compose](https://docs.docker.com/compose/compose-file/) configurations to run all microservices, see repository file `docker-compose.yml` and the project's `README.md` for instructions.

The following table describes the microservices, their endpoints, and their features.

**Project** | **API path** | **Language** | **Description**
------ | ------ | ------ | ------
[muncher](https://github.com/o2r-project/o2r-muncher) | `/api/v1/compendium` and `/api/v1/job`  | JavaScript (Node.js) | core component for [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) of compendia and jobs (ERC execution)
[loader](https://github.com/o2r-project/o2r-loader) | `/api/v1/compendium` (`HTTP POST` only) |  JavaScript (Node.js) | load workspaces from repositories and collaboration platforms
[finder](https://github.com/o2r-project/o2r-finder) | `/api/v1/search` | JavaScript (Node.js) | discovery and search, synchronizes the database with a search database (Elasticsearch) and exposes read-only search endpoints
[transporter](https://github.com/o2r-project/o2r-transporter) | `~ /data/` and `~* \.(zip|tar|tar.gz)` | JavaScript (Node.js) | downloads of compendia in zip or (gzipped) tar formats
[informer](https://github.com/o2r-project/o2r-informer) | `~* \.io` | JavaScript (Node.js) | [socket.io](http://socket.io/)-based WebSockets for live updates to the UI based on database event log, e.g. job progress
[inspecter](https://github.com/o2r-project/o2r-inspecter) | `/api/v1/inspection` | R ([plumber](https://www.rplumber.io/)) | allow inspection of non-text-based file formats, e.g. `.Rdata`
[substituter](https://github.com/o2r-project/o2r-substituter) | `/api/v1/substitution` |  JavaScript (Node.js) | create new ERCs based on existing ones by substituting files
[manipulater](https://github.com/o2r-project/o2r-manipulater/) | `under development` | -- | provide back-end containers for interactive ERCs

##### ERC exporting

**Project** | **API path** | **Language** | **Description**
------ | ------ | ------ | ------
[shipper](https://github.com/o2r-project/o2r-shipper) | `/api/v1/shipment` | Python | ship ERCs, including packaging, and their metadata to third party repositories and archives

##### Authentication

**Project** | **API path** | **Language** | **Description**
------ | ------ | ------ | ------
[bouncer](https://github.com/o2r-project/o2r-bouncer) | `/api/v1/auth`, `/api/v1/user/` | JavaScript (Node.js) | authentication service and user management (whoami, level changing)

##### Supporting services

Existing software projects can be re-used for common functionality, such as gathering statistics.
These supporting services run alongside the microservices in their own containers accessible via the main webservice.

**Project** | **Description**
------ | ------
[Piwik](https://matomo.org/) | collect user statistics

#### 5.3.2 Whitebox database

Two databases are used.

**[MongoDB](https://www.mongodb.com/) document database** with enabled [replica-set oplog](https://docs.mongodb.com/manual/core/replica-set-oplog/) for eventing.

Collections:

- `users`
- `sessions`
- `compendia`
- `jobs`
- `shipments`

The MongoDB API is used by connecting microservices via suitable client packages, which are available for all required languages.

**[Elasticsearch](https://elastic.co) search index**, kept in sync with the main document database by the microservice `finder`.
The ids are mapped to support update and delete operations.

The two main resources of the API are kept in separate indices due to [their different structure/mappings](https://www.elastic.co/blog/index-vs-type):

- `compendia` with type `compendia`
- `jobs` with type `jobs`

The search index is accessed by clients through the search endpoint provided by `finder`.

#### 5.3.3 Whitebox tools

**project** | **language** | **description**
------ | ------ | ------
[meta](https://github.com/o2r-project/o2r-meta) | Python | scripts for extraction, translation and validation of metadata; for details see [metadata documentation](/metadata)
[containerit](https://github.com/o2r-project/containerit) | R | generation of Dockerfiles based on R sessions and scripts

Each tool's code repository includes one or more `Dockerfiles`, which are automatically build and published on Docker Hub.
The microservices use the tool's Docker images to execute the tools instead of installing all their dependencies into the microservices.
The advantages are a controlled environment for the tool usage, independent development cycles and updating of the tools, smaller independent images for the microservices, and scalability.

#### Meta

Meta provides a CLI for each step of the metadata processing required in the reproducibility service as shown by the following diagram.
After each step the created metadata is saved as a file per model to a directory in the compendium.
A detailed view of the meta tool usage in the creation process is provided in the runtime view [ERC Creation](#61-erc-creation).

[![whitebox meta tool](img/5.2-whitebox-meta-tool.png)](img/5.2-whitebox-meta-tool.png)

#### Containerit

The containerit tool extracts required dependencies from ERC main documents and uses the information and external configuration to create a Dockerfile, which executes the full computational workflow when the container is started.
Its main strategy is to analyse the session at the end of executing the full workflow.

#### 5.3.4 Whitebox ephemeral file storage

A host directory is mounted into every container to the location `/tmp/o2r`.
