# o2r Architecture

## The project

Opening Reproducible Research (o2r) is a DFG-funded research project by Institute for Geoinformatics ([ifgi](http://www.uni-muenster.de/Geoinformatics/en/)) and University and Regional Library ([ULB](http://www.ulb.uni-muenster.de/)), University of Münster, Germany. Building on recent advances in mainstream IT, o2r envisions a new architecture for storing, executing and interacting with the original analysis environment alongside the corresponding research data and manuscript. This architecture evolves around so called Executable Research Compendia (ERC) as the container for both research, review, and archival.

## Microservice architecture

o2r applies a [microservice architecture](https://en.wikipedia.org/wiki/Microservices) to seperate functions of the [o2r API](http://o2r.info/o2r-web-api) into seperate software projects.

The remainder of this document is an overview of the existing o2r services and how they are integrated.

### Integration

The unifying component **in the back** currently is the database ([MongoDB](https://www.mongodb.com)). All information that must be shared between microservices is stored in the DB.

In the **front**, a reverse proxy maps the different parts of the API to the respective microservices.

A working [nginx](https://nginx.org) configuration is available [in the test setup](https://github.com/o2r-project/o2r-platform/blob/master/test/nginx.conf).

### Microservices

| **project** | **api path(s)** | **description** |
|  | |
| | |

### Storage

All microservices have access to a database to manage sessions/authentication and objects of the o2r API, e.g. compendia or jobs. 

To access the content of compendia, all microservices need access to a shared file-based storage.

### Integration via reverse proxy

## Run all microservices

For testing or development the [o2r-platform](https://github.com/o2r-project/o2r-platform) GitHub project contains [docker-compose](https://docs.docker.com/compose/compose-file/) configurations to run all microservices, see `o2r-platform/test`. Please check the projects README.md for instructions.

