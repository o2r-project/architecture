## 4. Solution strategy

This section provides a short overview of architecture decisions and for some the reasoning behind them.

### Web API

The developed solution is set in an existing system of services, and first and foremost must integrate well with these systems, focussing on the specific missing features of building and running ERCs.
These features are provided via a _well-defined RESTful API_.

### Microservices

To allow a dynamic development and support the large variety of skills, all server-side features are developed in independent _[microservices](https://en.wikipedia.org/wiki/Microservices)_.
These microservices handle only specific functional parts of the API and allow independent development and deployment cycles.
Core components are developed using server-side JavaScript based on Node.js while other components are implemented Python.

We accept this diversification _increases complexity_ of both development and testing environments and the deployment of said services.

Required documentation is minimal. The typical structure should follow common practices.

### Storage and intra-service communication

In accordance with the system scope, there is no reliable storage solution implemented.
The microservices simply share a common pointer to a local file system path.
Storage of ERC is only implemented to make the solution independent during development and for the needs of core functionality (temporal storage), but it is not a feature the solution will eventually provide.

The unifying component of the architecture is the _database_.
It is known to all microservices.

Some microservices communicate via an eventing mechanism for real-time updates, such as the search database and the component providing live updates to the user via WebSockets-
The eventing is based on the operation log of the database (which is normally used to synchronise database nodes).
This is a clear _misuse of an internal feature_, but a lot simpler than maintaining a full-blown eventing solution.

### Demonstration, user data & authentication

To be able to demonstrate the system, a _browser-based client application_ is developed.
It uses the RESTful API to control the system.
_OAuth 2.0_ is used for authentication and minimal information, which is already public, is stored for each user.
This information is shared between all services which require authentication via the database.

_The client application manages the control flow_ of all user interactions.

### Tools

If standalone tools are developed, they should provide a command-line interface (CLI).
The CLI allows integration into microservices when needed and to package tools including their dependencies as containers.
Thanks to the container architecture and the controlled, we don't need to worry about documentation for or distribution/packaging of these tools.
It must only be ensured they are correctly installed using the microservice's Dockerfile.
The only required documentation is for the installation into a container and usage of the CLI.
