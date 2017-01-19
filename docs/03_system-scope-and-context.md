## System scope and context

### Business context

<!-- **&lt;Diagram or Table&gt;**

Specification of *all* communication partners (users, IT-systems, ...) with explanations of domain specific inputs and outputs or interfaces. Optionally you can add domain specific formats or communication protocols. -->

Communication partner | Exchanged data | Technology/protocol
--------------------- | ------ | -------
**Publication platform**, e.g. [OJS](https://pkp.sfu.ca/ojs/) | paper information pages access ERC status and metadata; review process integrates ERC details | system's API using `HTTP` with `JSON` payload
**Storage & collaboration platform**, e.g. ownCloud/Sciebo, GitHub, ShareLatex, [OSF](https://osf.io/) | system fetches contents for building an ERC based on public links, e.g. GitHub repository or Sciebo shared folder | `WebDAV`, `ownCloud`, `HTTP`, `git`
**URI provider**, e.g. [ePIC](http://www.pidconsortium.eu/?page_id=74) | system retrieves persistent identifiers for own landing pages | `HTTP` API, see [ePIC docs](http://doc.pidconsortium.eu/guides/overview/)
**Third party** websites or services | third parties can browse, search, view, download, ... ERC via the system API | RESTful `HTTP` with `JSON` or archive payloads (`zip`, `tar.gz`)
**Catalogue and registry**, e.g. [CRIS](https://www.uni-muenster.de/FB7_MultimediaSupport/CRIS_Infoseite/Forschungsdatenbank_Infoseite.html), [DataCite](https://www.datacite.org/), [ORCID](http://orcid.org/), ... | the system can deliver metadata on published ERC to these catalogues, but also retrieve/harvest contextual metadata during ERC creation | `HTTP` APIs
**Domain data repository**, e.g. [PANGAEA](https://www.pangaea.de/) | system allows download of data during execution from selected/controlled online repositories | `HTTP` APIs
**Generic data repository**, e.g. [Zenodo](https://zenodo.org/), [Mendeley Data](https://data.mendeley.com/), [Figshare](http://figshare.com/), [OSF](https://osf.io/) | (a) system fetches ERC stored in repositories for inspection and execution; (b) system saves complete ERC to repositories; conceptually the system _does not persistently store anything_ | `HTTP` APIs, writing to repositories requires authentication
**Archive**, e.g. [DA NRW](https://www.danrw.de/), or archive system, e.g. [Archivematica](https://www.archivematica.org/) | Long-term preservation of ERC, can be initiated from both sides (archive, this system) | `HTTP` carrying bitstreams and metadata
**Authentication provider**, e.g. [ORCID](http://orcid.org/) | user IDs and authentication tokens | `HTTP`
**Software repository**, e.g. [Debian APT](https://wiki.debian.org/Apt), [Docker Hub](https://hub.docker.com/), [Ubuntu Launchpad](https://launchpad.net/ubuntu), [GitHub](https://github.com/) | software repository are accessed during creation of ERC, software in different forms is downloaded and installed into runtime images | `HTTP`, `FTP`?
**Cloud infrastructure or cluster**, e.g. self-hosted [Docker Swarm](https://www.docker.com/products/docker-swarm)-based, [Amazon EC2](), [Docker Cloud]() | The execution of ERC can be distributed accross a shared infrastructure, so complete ERC 
**Container registry**, e.g. [Docker Hub](https://hub.docker.com/), [Amazon ECR](https://aws.amazon.com/de/ecr/), [Docker Registry 2.0](https://github.com/docker/distribution) | The runtime containers that are created for ERCs should be stored in and loaded from a container registry (service or self-hosted) to share them effectively accross a distributed infrastructure | `HTTP`

**&lt;optionally: Explanation of external domain interfaces&gt;**

### Technical context

All components use `HTTP` over cable networks connections for communication of all exchanged data (metadata documents, ERC bundles, Linux containers, etc.).