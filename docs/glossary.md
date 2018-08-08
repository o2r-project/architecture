# Glossary

## Architecture

See [computer architecture](#computer-architecture).

## Computer Architecture

> [C]omputer architecture is a set of rules and methods that describe the functionality, organization, and implementation of computer systems. Some definitions of architecture define it as describing the capabilities and programming model of a computer but not a particular implementation. In other definitions computer architecture involves instruction set architecture design, microarchitecture design, logic design, and implementation.
> via [Wikipedia](https://en.wikipedia.org/wiki/Computer_architecture)

Common architectures are `amd64` or `x86_64`.

You can find out the operating system + architecture combinations supported by a specific Docker image, e.g. `golang`, with

```bash
$ docker run mplatform/mquery golang
Image: golang
 * Manifest List: Yes
 * Supported platforms:
   - linux/amd64
   - linux/arm/v7
   - linux/arm64/v8
   - linux/386
   - linux/ppc64le
   - linux/s390x
   - windows/amd64:10.0.14393.2068
   - windows/amd64:10.0.16299.248
```

## CRUD

Basic operations on a digital artefact are create, read, update, and delete, often abbreviated to "[CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)".

## Digital Object Identifier

See [DOI](#doi).

## DOI

> _In computing, a Digital Object Identifier or DOI is a persistent identifier or handle used to uniquely identify objects [..]_
> _A DOI aims to be "resolvable", usually to some form of access to the information object to which the DOI refers._
> via [Wikipedia](https://en.wikipedia.org/wiki/Digital_object_identifier), see also [https://doi.org](https://doi.org)

## ERC

Executable Research Compendium, see this [scientific article](https://doi.org/10.1045/january2017-nuest) for concepts and the [specification](https://o2r.info/erc-spec) for technical documentation.

## Executable Research Compendium

See [ERC](#erc).

## JavaScript Promises

> _A Promise is an object representing the eventual completion or failure of an asynchronous operation. [...] Essentially, a promise is a returned object to which you attach callbacks, instead of passing callbacks into a function._
> via [MDN web docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises)

## Kernel

> _The kernel is a computer program that is the core of a computer's operating system, with complete control over everything in the system._
> via [Wikipedia](https://en.wikipedia.org/wiki/Kernel_(operating_system))

A common example is the [Linux kernel](https://en.wikipedia.org/wiki/Linux_kernel).

## Literate Programming

> _Literate programming is a programming paradigm [..] in which a program is given as an explanation of the program logic in a natural language, such as English, interspersed with snippets of macros and traditional source code, from which a compilable source code can be generated._
> via [Wikipedia](https://en.wikipedia.org/wiki/Literate_programming)