## 3. System scope and context

### 3.1 Business context

[![business context](img/3.1-business-context.png)](img/3.1-business-context.png)

<!-- Specification of *all* communication partners (users, IT-systems, ...) with explanations of domain specific inputs and outputs or interfaces. Optionally you can add domain specific formats or communication protocols. -->

Communication partner | Exchanged data | Technology/protocol
--------------------- | ------ | -------
**Reproducibility service**, e.g. [o2r](http://o2r.info/results) | publication platforms utilize creation and execution services of ERC, reproducibility service uses repositories to retrieve software artifacts, store runtime environment images, and save complete ERC | `HTTP` APIs |
**Publication platform** | users access ERC status and metadata via search results and paper landing pages; review process integrates ERC details and control; | system's API using `HTTP` with `JSON` payload
[//]: <> (**Third party** websites or services | third parties can browse, search, view, download, ... ERC via the system API | RESTful `HTTP` with `JSON` or archive payloads (`zip`, `tar.gz`))
**ID provider** | retrieve unique user IDs, user metadata, and authentication tokens; user must log in with the provider | `HTTP`
**Execution infrastructure** | ERC can be executed using a shared/distributed infrastructure | `HTTP`
**Data repository** | the reproducibility service fetches (a) content for ERC creation, or (b) complete ERC, from different sources and stores crated ERC persistently at suitable repositories | `HTTP`, `FTP`, `WebDAV`, `git`
**Registry** | the reproducibility service can deliver metadata on published ERC to registries/catalogues/search portals, but also retrieve/harvest contextual metadata during ERC creation; users discover ERC on these platforms | (proprietary) `HTTP` APIs, persistent identifiers (`DOI`), `OAI-PMH`
**Software repository** | software repository provide software artifacts during ERC creation and store executable runtime environments | `HTTP` APIs

<!-- **&lt;optionally: Explanation of external domain interfaces&gt;** -->

### 3.2 Technical context

All components use `HTTP` over cable networks connections for communication of all exchanged data (metadata documents, ERC bundles, Linux containers, etc.).