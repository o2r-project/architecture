# o2r Architecture

## The project

Opening Reproducible Research (o2r) is a DFG-funded research project by Institute for Geoinformatics ([ifgi](http://www.uni-muenster.de/Geoinformatics/en/)) and University and Regional Library ([ULB](http://www.ulb.uni-muenster.de/)), University of Münster, Germany. Building on recent advances in mainstream IT, o2r envisions a new architecture for storing, executing and interacting with the original analysis environment alongside the corresponding research data and manuscript. This architecture evolves around so called Executable Research Compendia (ERC) as the container for both research, review, and archival.

To implement this new approach the project members create Open Source software projects for [a web API](https://github.com/o2r-project/architecture#web-api) and [standalone tools](https://github.com/o2r-project/architecture#standalone-tools).

## Web API

o2r applies a [microservice architecture](https://en.wikipedia.org/wiki/Microservices) to separate functions of the [o2r API](http://o2r.info/o2r-web-api) into independent software projects. Each microservice is encapsulated as a [Docker](http://docker.com/) container.

## Metadata processes

See [METADATA](METADATA.md).

## o2r Services

This section is an overview of the existing o2r services and how they are integrated.

### Integration

The unifying component **in the back** currently is the database ([MongoDB](https://www.mongodb.com)). All information that must be shared between microservices is stored in the DB.

In the **front**, a reverse proxy maps the different parts of the API to the respective microservices.

A working [nginx](https://nginx.org) configuration is available [in the test setup](https://github.com/o2r-project/o2r-platform/blob/master/test/nginx.conf).

### Microservices

**project** | **api path(s)** | **language** | **description**
------ | ------ | ------ | ------
[platform](https://github.com/o2r-project/o2r-platform) | `/` | HTML, JavaScript (AngularJS) | the client project, based on AngularJS
[muncher](https://github.com/o2r-project/o2r-muncher) | `/api/v1/compendium`, `/api/v1/job` | JavaScript (Node.js) | core component for container execution and CRUD for compendia and jobs
[bouncer](https://github.com/o2r-project/o2r-bouncer) | `/api/v1/auth`, `/api/v1/user/` | JavaScript (Node.js) | authentication service and user information (whoami)
[informer](https://github.com/o2r-project/o2r-informer) | `~* \.io` | JavaScript (Node.js) | [socket.io](http://socket.io/)-based WebSockets for live updates
[finder](https://github.com/o2r-project/o2r-finder) | `/api/v1/search` | JavaScript (Node.js) | discovery and search, synchronizes the database with a search database (Elasticsearch) and exposes read-only search endpoints
[contentbutler](https://github.com/o2r-project/o2r-contentbutler) | `~ /data/` | JavaScript (Node.js) | access to content of compendia, reads file-base storage
[transportar](https://github.com/o2r-project/o2r-transportar) | `~* \.(zip|tar|tar.gz)` | JavaScript (Node.js) | downloads of compendia in zip or (gzipped) tar formats
[shipper](https://github.com/o2r-project/o2r-shipper) | `/api/v1/shipment` | Python | save compendia to repositories and archives

The following microservices are currently under development.

**project** | **api path(s)** | **language** | **description**
------ | ------ | ------ | ------
[loader](https://github.com/o2r-project/o2r-loader) | `under development` | JavaScript | load workspaces from repositories and cloud platforms

### Storage

All microservices have access to a database to manage sessions/authentication and objects of the o2r API, e.g. compendia or jobs.

To access the content of compendia, all microservices need access to a shared file-based storage.

### Eventing

MongoDB's [replica-set oplog](https://docs.mongodb.com/manual/core/replica-set-oplog/) is misused as an eventing engine to synchronize MongoDB and Elasticsearch and also to implement real-time WebSocket-based notifications. This is expected to be replaced by a proper eventing layer for productive deployments.

### Run all microservices

For testing or developing the [o2r-platform](https://github.com/o2r-project/o2r-platform) GitHub project contains [docker-compose](https://docs.docker.com/compose/compose-file/) configurations to run all microservices, see the repository's directory `/test` and check the projects README.md for instructions.

## Standalone tools

Some functionality is not limited to the o2r web API or developed independently for practical reasons. This section lists these standalone libraries and tools.

**project** | **language** | **description**
------ | ------ | ------
[meta](https://github.com/o2r-project/o2r-meta) | Python | scripts for extraction, translation and validation of metadata, used by Node.js microservices using CLI calls
