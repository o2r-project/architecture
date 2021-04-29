# Opening Reproducible Research System Architecture

Project website: [https://o2r.info](https://o2r.info)

**Read architecture description online: [https://o2r.info/architecture](https://o2r.info/architecture)**

## The project

Opening Reproducible Research (o2r) is a DFG-funded research project by Institute for Geoinformatics ([ifgi](http://www.uni-muenster.de/Geoinformatics/en/)) and University and Regional Library ([ULB](http://www.ulb.uni-muenster.de/)), University of Münster, Germany. Building on recent advances in mainstream IT, o2r envisions a new architecture for storing, executing and interacting with the original analysis environment alongside the corresponding research data and manuscript. This architecture evolves around so called _Executable Research Compendia_ (ERC) as the container for both research, review, and archival.

## Guidelines

See [CONTRIBUTING.md](CONTRIBUTING.md)

## Build

This specification is written in [Markdown](https://daringfireball.net/projects/markdown/), rendered with [MkDocs](http://www.mkdocs.org/) using a few [Python Markdown extensions](https://pythonhosted.org/Markdown/extensions/index.html), and deployed automatically using a Github Action.

![badge for workflow status](https://github.com/o2r-project/architecture/actions/workflows/generate_pdf.yml/badge.svg)

Use `mkdocs` to render it locally.

```bash
# pip install mkdocs mkdocs-cinder
mkdocs serve
```

### Automated Builds
The `deploy_site.yml` will run the `mkdocs` command on every direct commit or merge on the master branch and deploy the rendered HTML documents to the `gh-pages` branch in this repository.

The action authenticates its push to the `gh-pages` branch using the [checkout action](https://github.com/actions/checkout) and the credentials of the user [@o2r-user](https://github.com/o2r-user), who has write access to this repository. It is finalized through the [github pages deploy action](https://github.com/marketplace/actions/deploy-to-github-pages).

## Diagrams

The diagrams are created with [yEd](https://www.yworks.com/products/yed).
All source files (`.graphml`) are stored in `/docs/img`.
The PNG renderings are exported from yEd with `transparent` background, a margin of `5`, and a scaling factor of `1.0`.

## License

The o2r Executable Research Compendium specification is licensed under [Creative Commons CC0 1.0 Universal License](https://creativecommons.org/publicdomain/zero/1.0/), see file `LICENSE`.
To the extent possible under law, the people who associated CC0 with this work have waived all copyright and related or neighboring rights to this work.
This work is published from: Germany.
