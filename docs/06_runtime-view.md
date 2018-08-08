## 6. Runtime view

The runtime view describes the interaction between the static building blocks.
It cannot cover all potential cases and focusses on the following main scenarios.

**Scenario** | **Purpose and overview**
------ | ------
ERC Creation | The most important workflow for an author is creating an ERC from his workspace of data, code and documentation. The author can provide these resources as a direct upload, but a more comfortable process is loading the files from a collaboration platform. Three microservices are core to this scenario: `loader`, `muncher`, and `shipper`.
ERC Inspection | The most important workflow for a reviewer or reader is executing the analysis encapsulated in an ERC. The execution comprises creation of configuration files (if missing) from metadata, compiling the a display file using the actual analysis, and saving the used runtime environment. The core microservice for this scenario is `muncher`.

### 6.1 ERC Creation

[![runtime view ERC creation](img/6.1-runtime-view-creation.png)](img/6.1-runtime-view-creation.png)

First, the user initiates a _creation_ of a new ERC based on a workspace containing at least a viewable file (e.g. an HTML document or a plot) based on the code and instructions provided in a either a script or [literate programming document](/glossary#literate-programming)), and any other data.
The [`loader`](#531-whitebox-microservices) runs a series of steps: fetching the files, checking the incoming workspace structure, extracting raw metadata from the workspace, brokering raw metadata to o2r metadata, and saving the compendium to the database.
The compendium is now a non-public _candidate_, meaning only the uploading user or admin users can see and edit it.
All metadata processing is based on the tool [`meta`](#533-whitebox-tools).

Then the user opens the candidate compendium, reviews and completes the metadata, and saves it.
Saving triggers a metadata validation in [`muncher`](#531-whitebox-microservices).
If the validation succeeds, the metadata is brokered to several output formats as files within the compendium using [`meta`](#533-whitebox-tools), and then re-loaded to the database for better [searchability](#532-whitebox-database).

Next, the user must start a _job_ to add the ERC configuration and runtime environment to the workspace, which are core elements of an ERC.
The ERC configuration is a file generated from the user-provided metadata (see [ERC specification](https://o2r.info/erc-spec/spec/#erc-configuration-file)).
The runtime environment consists of two parts: (a) the runtime manifest, which is created by executing the workflow once in a container based on the tool [`containerit`](#533-whitebox-tools); and (b) the runtime image, which is built from the runtime manifest.
A user may provide the ERC configuration file and the runtime manifest with the workspace for fine-grained control; the generation steps are skipped then.

Finally the user starts a shipment of the compendium to a data repository.
The [`shipper`](#531-whitebox-microservices) manages this two step process.
The separate "create" and "publish" steps allow checking the shipped files and avoid unintentional shipments, because a published shipment creates an non-erasable public resource.

!!! Note "_In the code_"
    The `loader` has two core controllers for direct _upload_ and _load_ from a collaboration platform.
    Their core chain of functions are realised as [JavaScript Promises](/glossary#javascript-promises), see the code for [loader](https://github.com/o2r-project/o2r-loader/blob/master/lib/loader.js#L48) and [uploader](https://github.com/o2r-project/o2r-loader/blob/master/lib/uploader.js#L44) respectively.
    The respective steps are shared between these two cases where possible, i.e. starting with the step `stripSingleBasedir`.

### 6.2 ERC Inspection

[![runtime view ERC inspection](img/6.2-runtime-view-inspection.png)](img/6.2-runtime-view-inspection.png)

The user initiates an _inspection_ of an existing ERC by providing a reference such as [DOI](/glossary#doi) or URL.
[`loader`](#531-whitebox-microservices) retrieves the compendium files, saves them locally and loads the contained metadata.
Then the user can start a new _job_ for the compendium.
[`muncher`](#531-whitebox-microservices) checks the request, creates a new job in the database and returns the job ID.
The user's client can use the ID to connect to the live logs provided by [`informer`](#531-whitebox-microservices).
All following steps by muncher regularly update the database, whose change events `informer` uses to continuously update client via WebSockets.

The job starts with creating a copy of the compendium's files for the job.
A [copy-on-write filesystem](https://en.wikipedia.org/wiki/Copy-on-write) is advantageous for this step.
Then the archived runtime image is loaded from the file in the compendium into a runtime repository.
This repository may be remote (either public or private, e.g. based on [Docker Registry](https://github.com/docker/distribution), [ECR](https://aws.amazon.com/ecr/) or [GitLab](https://docs.gitlab.com/ce/user/project/container_registry.html)) or simply the local image storage.
Then all files except the runtime image archive are packed so they can be send to a container runtime.
The container runtime can be local (e.g. the Docker daemon), or a container orchestration such as [Kubernetes](https://en.wikipedia.org/wiki/Kubernetes).
It provides log updates as a stream to `muncher`, which updates the database, whose changes trigger updates of the user interface via `informer`.
When the container is finished, `muncher` compares the created outputs with the ones provided in the compendium and provides the result to the user.

!!! Note "_In the code_"
    The `muncher` has two core resources: a _compendium_ represents an ERC, a _job_ represents a _"run"_ of an ERC, i.e. the building, running, and saving of the runtime environment including execution of the contained workflow.
    The core function for this is the `Executor`, which chains a number of steps using [JavaScript Promises](/glossary#javascript-promises), see the [code](https://github.com/o2r-project/o2r-muncher/blob/master/lib/executor.js#L1306).
    The check uses the tool [`erc-checker`](https://github.com/o2r-project/erc-checker).
