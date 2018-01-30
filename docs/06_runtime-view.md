## 6. Runtime view

The runtime view describes the interaction between the static building blocks.
It cannot cover all potential cases and focusses on the following main scenarios.

**Scenario** | **Purpose and overview**
------ | ------
ERC Creation | The most important workflow for an author is creating an ERC from his workspace of data, code and documentation. The author can provide these resources as a direct upload, but a more comfortable process is loading the files from a collaboration platform. Three microservices are core to this scenario: `loader`, `muncher`, and `shipper`.
ERC Inspection | The most important workflow for a reviewer or reader is executing the analysis encapsulated in an ERC. The execution comprises creation of configuration files (if missing) from metadata, compiling the a display file using the actual analysis, and saving the used runtime environment. The core microservice for this scenario is `muncher`.

### 6.1 ERC Creation

[![runtime view ERC creation](img/6.1-runtime-view-creation.png)](img/6.1-runtime-view-creation.png)

First, the user initiates a _creation_ of a new ERC.
The `loader` fetches the files, runs some checks, starts metadata extraction, starts metadata brokering from the raw metadata to o2r metadata, and saves the compendium, as a non-public candidate which only the uploading user can see, to the database.

Then the user opens the candidate compendium, checks and completes the metadata.
`muncher` triggers a metadata validation and brokering to several output formats, and loads the brokered metadata from the files to save it in the database.

Finally the user starts a shipment of the compendium to a data repository.
The `shipper` manages this two step process.
The separate "create" and "publish" steps allow checking the shipped files, and avoid unintentional shipments, because a published shipment creates a unique public resource, which potentially cannot be unpublished.

!!! Note "_In the code_"
    The `loader` has two core controllers for direct _upload_ and _load_ from a collaboration platform.
    Their core chain of functions are realised as [JavaScript Promises](/glossary#javascript-promises), see the code for [loader](https://github.com/o2r-project/o2r-loader/blob/master/lib/loader.js#L48) and [uploader](https://github.com/o2r-project/o2r-loader/blob/master/lib/uploader.js#L44) respectively.
    The respective steps are shared between these two cases where possible, i.e. starting with the step `stripSingleBasedir`.

### 6.2 ERC Inspection

[![runtime view ERC inspection](img/6.2-runtime-view-inspection.png)](img/6.2-runtime-view-inspection.png)

The user initiates and _inspection_ of an existing ERC.
The ERC ...

!!! Note "_In the code_"
    The `muncher` has two core resources: a _compendium_ represents an ERC, a _job_ represents an _"execution"_ or a _"run"_ an ERC, i.e. the building, running, and saving of the runtime environment to create outputs (e.g. a viewable file, plots, or data) from the code and instructions provided in the ERC (script, [literate programming document](/glossary#literate-programming)).
    The core function for this is the `Executor`, which chains a number of steps using [JavaScript Promises](/glossary#javascript-promises), see the [code](https://github.com/o2r-project/o2r-muncher/blob/master/lib/executor.js#L1306).
