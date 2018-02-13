## 3. System scope and context

### 3.1 Business context

[![business context](img/3.1-business-context.png)](img/3.1-business-context.png)

Communication partner | Exchanged data | Technology/protocol
--------------------- | ------ | -------
**Reproducibility service**, e.g. [o2r reference implementation](http://o2r.info/results) | publication platforms utilize creation and examination services for ERC; reproducibility service uses different _supporting services_ to retrieve software artifacts, store runtime environment images, execute workflows, and save complete ERC | `HTTP` APIs |
**Publishing platform**, e.g. online journal website or review system | users access ERC status and metadata via search results and paper landing pages; review process integrates ERC details and supports manipulation; | system's API using `HTTP` with `JSON` payload
**Collaboration platform** | provide means to collaboratively work on data, code, or text; such platforms support both public and private (shared) digital workspaces | `HTTP`
**ID provider** | retrieve unique user IDs, user metadata, and authentication tokens; user must log in with the provider | `HTTP`
**Execution infrastructure** | ERC can be executed using a shared/distributed infrastructure | `HTTP`
**Data repository** | the reproducibility service fetches (a) content for ERC creation, or (b) complete ERC, from different sources; it stores created ERC persistently at suitable repositories, which in turn may connect to long-term archives and preservation systems | `HTTP`, `FTP`, `WebDAV`, `git`
**Registry (metadata)** | the reproducibility service can deliver metadata on published ERC to registries/catalogues/search portals directly and mediately via data repositories; the service can also retrieve/harvest contextual metadata during ERC creation to reduce required user inputs; users discover ERC via registries | (proprietary) `HTTP` APIs, persistent identifiers (`DOI`), `OAI-PMH`
**Software repository** | software repository provide software artifacts during ERC creation and store executable runtime environments | `HTTP` APIs
**Archives and digital preservation systems** | saving ERCs in preservation systems includes extended data and metadata management (cf. private/group domain vs. persistent domain in the [Curation Domain Model](http://www.forschungsdaten.org/index.php/Curation_Domain_Model) (in German)), because a different kind of access and re-use is of concern for these systems; these concerns are relevant in so far as the intermediary _data repositories_ must be supported, but further aspects, e.g. long-term access rights, are only mediately relevant for the reproducibility service | metadata in `JSON` and `XML` provided as part of `HTTP` requests or as files within payloads

### 3.2 Technical context

All components use `HTTP(S)` over cable networks connections for communication (metadata documents, ERC, Linux containers, etc.).
